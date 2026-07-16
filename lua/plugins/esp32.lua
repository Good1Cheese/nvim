if vim.env.NVIM_ESP32 ~= "1" then
    return {}
end

return {
    "Aietes/esp32.nvim",
    lazy = false,
}
