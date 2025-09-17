import * as vscode from "vscode";
import * as path from "path";

import { getIsDevelopment } from "./state";

let lua_config = vscode.workspace.getConfiguration("Lua");
let wow_config = vscode.workspace.getConfiguration("tinkrAPI");

const author = "amstaffix";
const extensionName = "tinkr-lua-api";

const luaSettings = [
	"runtime.version",
	"runtime.builtin",
	"workspace.library",
];

export function configLuaLS(onDidChange: boolean) {
	if (!wow_config.get("devMode")) {
		setTimeout(() => {
			setTinkrLibrary();
			cleanConfigTarget(onDidChange);
		}, getRandomArbitrary(100, 2000));
	}
}

function getRandomArbitrary(min: number, max: number): number {
	return Math.random() * (max - min) + min;
}

function getConfigurationTarget() {
	const scope = wow_config.get("luals.configurationScope");
	if (scope === "User") {
		return vscode.ConfigurationTarget.Global;
	}
	else if (scope === "Workspace") {
		return vscode.ConfigurationTarget.Workspace;
	}
}

// add wow-api path to luals library
function setTinkrLibrary() {
	const extension = vscode.extensions.getExtension(author + "." + extensionName)!;
	let folderPath;
	const pos = extension.extensionPath.indexOf(".vscode"); // should also work for .vscode-insiders
	if (pos > -1) {
		folderPath = path.join("~", extension.extensionPath.substring(pos), "lua-definitions");
	}
	else {
		folderPath = path.join(extension.extensionPath, "lua-definitions");
	}
	const lib = lua_config.inspect("workspace.library");
	const configTarget = getConfigurationTarget();
	let libraryPath: string[] = [];
	if (configTarget === vscode.ConfigurationTarget.Global) {
		libraryPath = lib?.globalValue as string[];
	}
	else if (configTarget === vscode.ConfigurationTarget.Workspace) {
		libraryPath = lib?.workspaceValue as string[];
	}

	if (libraryPath.includes(folderPath)) {
		return; // do nothing
	}

	let res: string[] = [];
	// clean exclusively our old paths while not in development mode; otherwise yeet everything
	if (!getIsDevelopment()) {
		res = libraryPath?.filter(el => !el.includes(author + "." + extensionName)) ?? [];
	}
	res.push(folderPath);
	lua_config.update("workspace.library", res, configTarget);
}

// if we are configured to use user settings we need to delete our workspace settings
// the other way round we only delete it when actually migrating from user to workspace
function cleanConfigTarget(onDidChange: boolean) {
	const configTarget = getConfigurationTarget();
	if (configTarget === vscode.ConfigurationTarget.Global) {
		for (const v of luaSettings) {
			// dont update if there is nothing to delete
			// otherwise it will create an empty settings.json file if it does not exist yet
			if (lua_config.inspect(v)?.workspaceValue) {
				lua_config.update(v, undefined, vscode.ConfigurationTarget.Workspace);
			}
		}
	}
	else if (configTarget === vscode.ConfigurationTarget.Workspace && onDidChange) {
		for (const v of luaSettings) {
			if (v === "workspace.library") {
				// preserve any user defined paths in User scope
				const lib = lua_config.inspect("workspace.library")?.globalValue as string[];
				const res = lib?.filter(el => !el.includes(author + "." + extensionName));
				if (res) {
					lua_config.update(v, res.length > 0 ? res : undefined, vscode.ConfigurationTarget.Global);
				}
			} else {
				lua_config.update(v, undefined, vscode.ConfigurationTarget.Global);
			}
		}
	}
}

vscode.workspace.onDidChangeConfiguration((event: vscode.ConfigurationChangeEvent) => {
	if (event.affectsConfiguration("Lua")) {
		// update configuration caches
		lua_config = vscode.workspace.getConfiguration("Lua");
	}
	if (event.affectsConfiguration("tinkrAPI")) {
		wow_config = vscode.workspace.getConfiguration("tinkrAPI");
		if (event.affectsConfiguration("tinkrAPI.luals.configurationScope")) {
			configLuaLS(true);
		}
	}
});

// check if the extension has been configured before in the workspace or user settings
export function isConfigured() {
	const config = vscode.workspace.getConfiguration("Lua");
	// config.get returns the workspace config if it exists, otherwise the global user config
	const lib = config.get("workspace.library") as string[];
	return lib.find((value) => value.includes("tinkr-api")) || lib.find((value) => value.includes("tinkr-lua-api"));;
}