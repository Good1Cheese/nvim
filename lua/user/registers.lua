-- Black hole register mappings (replaces cutlass plugin)
local mappings = {
    { "n", "d",  '"_d' },
    { "n", "dd", '"_dd' },
    { "n", "D",  '"_D' },
    { "n", "c",  '"_c' },
    { "n", "cc", '"_cc' },
    { "n", "C",  '"_C' },
    { "n", "s",  '"_s' },
    { "n", "S",  '"_S' },
    { "n", "x",  '"_x' },
    { "v", "d",  '"_d' },
    { "v", "c",  '"_c' },
    { "v", "s",  '"_s' },
    { "v", "x",  '"_x' },
}

for _, map in ipairs(mappings) do
    vim.keymap.set(map[1], map[2], map[3])
end

-- Cut key (equivalent to cutlass cut_key = "X")
vim.keymap.set("n", "X", "d")
vim.keymap.set("v", "X", "d")
