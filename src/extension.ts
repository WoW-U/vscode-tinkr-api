import * as vscode from "vscode";

import { setIsDevelopment } from "./state";
import * as luals from "./luals";

let myOutputChannel: vscode.OutputChannel;
let isLoaded = false;

export async function activate(context: vscode.ExtensionContext) {
	myOutputChannel = vscode.window.createOutputChannel("Tinkr API");
	context.subscriptions.push(myOutputChannel);
	myOutputChannel.appendLine("activate() func has been called");

	console.log("loaded", context.extension.id);
	setIsDevelopment(context.extensionMode === vscode.ExtensionMode.Development);
	registerActivationCommand(context);

	if (luals.isConfigured()) {
		myOutputChannel.appendLine("extension is configured, lets recheck it.");
		activateTinkrExtension(context);
	}
}

async function activateTinkrExtension(context: vscode.ExtensionContext) {
	isLoaded = true;
	luals.configLuaLS(false);
}

function registerActivationCommand(context: vscode.ExtensionContext) {
	const handler = () => {
		if (!isLoaded) {
			const tinkr_config = vscode.workspace.getConfiguration("tinkrAPI");
			// some users expect the extension to just work while not in an addon or workspace
			if (vscode.workspace.workspaceFolders) {
				tinkr_config.update("luals.configurationScope", "Workspace", vscode.ConfigurationTarget.Global);
				vscode.window.showInformationMessage("Activated Tinkr API extension (Workspace settings).");
			}
			else {
				tinkr_config.update("luals.configurationScope", "User", vscode.ConfigurationTarget.Global);
				vscode.window.showInformationMessage("Enabled Tinkr API extension (User settings).");
			}
			activateTinkrExtension(context);
		}
		else {
			vscode.window.showInformationMessage("Tinkr API extension is already activated.");
		}
	};
	context.subscriptions.push(vscode.commands.registerCommand("tinkrAPI.activateExtension", handler));
}