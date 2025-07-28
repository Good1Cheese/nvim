-- Config for docker_compose_language_service
return {
	cmd = { "docker-compose-langserver", "up", "--stdio" },
	filetypes = { "yaml.docker-compose" },
	root_markers = { "docker-compose.yaml",
		"docker-compose.yml",
		"compose.yaml",
		"compose.yml"
	},
}
