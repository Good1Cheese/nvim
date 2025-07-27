-- Config for dockerls
return {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
	root_dir = require("lsp.utils").root_pattern("Dockerfile", ".git")
}
