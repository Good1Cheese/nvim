-- Config for pylsp (Python LSP)
return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_dir = require("lsp.utils").root_pattern("pyproject.toml", "setup.cfg", "setup.py", ".git"),
	settings = {
		pylsp = {
			plugins = {
				autopep8 = { enabled = false },
				black = { enabled = true },
				flake8 = { enabled = true },
				jedi_definition = { follow_builtin_imports = true, follow_imports = true },
				jedi_references = { include_builtins = true },
				jedi_signature_help = { enabled = true },
				jedi_symbols = { all_scopes = true },
				mccabe = { enabled = false },
				pycodestyle = { enabled = false },
				pydocstyle = { enabled = true },
				pyflakes = { enabled = false },
				rope_completion = { enabled = true },
				yapf = { enabled = false }
			}
		}
	}
}
