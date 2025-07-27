-- Config for docker_compose_language_service
return {
	cmd = { "docker-compose-language-service", "up", "--stdio" },
	filetypes = { "dockerfile", "docker-compose" },
	root_dir = require("lsp.utils").root_pattern("docker-compose.yml", "docker-compose.yaml", ".git")
}
