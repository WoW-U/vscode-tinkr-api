import * as vscode from 'vscode';
import * as path from 'path';

export function activate(context: vscode.ExtensionContext) {
    // Path to your Lua definitions folder
    const luaDefinitionsPath = path.join(context.extensionPath, 'lua-definitions');

    // Check if the Lua extension is installed
    const luaExtension = vscode.extensions.getExtension('sumneko.lua');
    if (!luaExtension) {
        vscode.window.showErrorMessage('The Lua extension (sumneko.lua) is not installed.');
        return;
    }

    // Get the current workspace configuration
    const config = vscode.workspace.getConfiguration('Lua', null);

    // Get the current `workspace.library` setting
    const workspaceLibrary: string[] = config.get('workspace.library', []);

    // Check if the path is already in the `workspace.library` setting
    if (!workspaceLibrary.includes(luaDefinitionsPath)) {
        // Determine the configuration target (workspace or global)
        const target = vscode.workspace.workspaceFolders ? vscode.ConfigurationTarget.Workspace : vscode.ConfigurationTarget.Global;

        // Add the path to the `workspace.library` setting
        config.update('workspace.library', [...workspaceLibrary, luaDefinitionsPath], target)
            .then(() => {
                // vscode.window.showInformationMessage(`Added Tinkr Lua definitions to ${target === vscode.ConfigurationTarget.Workspace ? 'workspace' : 'global'} settings: ${luaDefinitionsPath}`);
            }, (error) => {
                vscode.window.showErrorMessage(`Failed to update settings: ${error}`);
            });
    } else {
        // vscode.window.showInformationMessage('Tinkr Lua definitions are already configured.');
    }
}

export function deactivate() {
    console.log('Extension "lua-definitions-helper" is now deactivated.');
}