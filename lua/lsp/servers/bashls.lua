-- Config for bashls (Bash LSP)
return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "zsh" },
	root_dir = require("lsp.utils").root_pattern(".bashrc", ".zshrc", ".git"),
	settings = {
		bashIde = {
			-- Add bash-specific settings here
			shellcheck = {
				enable = true,
				severity = "warning"
			},
			diagnostics = {
				enable = true
			}
		}
	}
}
