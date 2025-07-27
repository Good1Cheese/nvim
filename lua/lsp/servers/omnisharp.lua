-- Config for omnisharp (C# LSP)
return {
	cmd = { "omnisharp", "--languageserver" },
	filetypes = { "cs" },
	root_dir = require("lsp.utils").root_pattern(
		"*.sln",
		"*.csproj",
		".editorconfig",
		".git"
	),
	settings = {
		["omnisharp"] = {
			organizeImportsOnFormat = true,
			enableEditorConfigSupport = true,
			addImportOnPaste = false,
			analyzeOpenDocumentsOnly = true,
			codeActionsOnSave = {
				"Microsoft.CodeQuality.Analyzers",
				"Microsoft.CodeQuality.CSharp.Analyzers"
			},
			roslynAnalyzersEnabled = true,
			inlayHints = {
				enableForParameters = true,
				forLiteralExpressions = true,
				forTypes = true
			}
		}
	}
}
