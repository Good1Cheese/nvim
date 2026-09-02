local Plugin = { "CRAG666/code_runner.nvim" }

Plugin.filetypes = {
    nix = "nix-instantiate --eval --strict $fileName",
    lua = "cd $dir && lua $fileName",
    rb = "cd $dir && ruby $fileName",
    cs = "dotnet run --project $dir",
    rust = function()
        local current_dir = vim.fn.expand("%:p:h")
        local cargo_toml = vim.fs.find("Cargo.toml", {
            upward = true,
            path = current_dir,
            type = "file",
        })[1]

        if cargo_toml then
            local cargo_root = vim.fs.dirname(cargo_toml)
            local cargo_command = vim.fn.expand("%:t"):find("_test%.rs$") and "cargo test" or "cargo run"
            return ("cd %s && %s"):format(vim.fn.shellescape(cargo_root), cargo_command)
        end

        return {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt",
        }
    end,
    python = "python $fileName",
    cpp = {
        "cd $dir &&",
        "g++ $fileName",
        "-o /tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt",
    },
    erlang = {
        "cd $dir &&",
        "erlc $fileName &&",
        "erl -noshell -s $fileNameWithoutExt start -s init stop",
    },
    java = {
        "cd $dir &&",
        "javac $fileName -d out/ &&",
        "java -classpath out/ $fileNameWithoutExt",
    },
    go = function()
        local file = vim.fn.expand("%")
        if file:find("_test", 1, true) then
            return "ginkgo ."
        end

        return {
            "cd $dir &&",
            "go build -o /tmp/$fileNameWithoutExt &&",
            "/tmp/$fileNameWithoutExt",
        }
    end,
    c = function()
        local file = vim.fn.expand("%")
        if file:find("disas", 1, true) then
            return {
                "cd $dir &&",
                "gcc $fileName",
                "-o $fileNameWithoutExt",
            }
        end

        if file:find("solution", 1, true) then
            return {
                "cd $dir &&",
                "gcc -std=c18 tests.c solution.c",
                "-lcriterion",
                "-o /tmp/tests &&",
                "/tmp/tests",
            }
        end

        return {
            "cd $dir &&",
            "gcc $fileName",
            "-o /tmp/$fileNameWithoutExt &&",
            "/tmp/$fileNameWithoutExt",
        }
    end,
    asm = {
        "cd $dir &&",
        "nasm -f elf64 $fileName -o /tmp/$fileNameWithoutExt.o &&",
        "ld -s -o /tmp/$fileNameWithoutExt /tmp/$fileNameWithoutExt.o &&",
        "/tmp/$fileNameWithoutExt",
    },
}

Plugin.keys = {
    { "<leader>c", "<cmd>write<cr><cmd>RunFile<cr>", desc = "Run file" },
    { "<leader>C", "<cmd>RunClose<cr>", desc = "Close runner" },
}

Plugin.cmd = {
    "RunCode",
    "RunFile",
    "RunProject",
    "RunClose",
    "CRFiletype",
    "CRProjects",
}

Plugin.opts = {
    mode = "term",
    focus = false,
    hot_reload = false,
    filetype = Plugin.filetypes,
}

return Plugin
