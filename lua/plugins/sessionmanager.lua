return {
  {
    'Shatur/neovim-session-manager',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Убедитесь, что plenary.nvim установлен
    config = function()
      local Path = require 'plenary.path'
      local config = require 'session_manager.config'
      require('session_manager').setup {
        sessions_dir = Path:new(vim.fn.stdpath 'data', 'sessions'), -- Путь для сохранения сессий
        autosave_last_session = true, -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = false, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autoload_mode = config.AutoloadMode.LastSession,
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
          'gitcommit',
          'gitrebase',
        },
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        load_include_current = false, -- The currently loaded session appears in the load_session UI.
      }
    end,
  },
}
