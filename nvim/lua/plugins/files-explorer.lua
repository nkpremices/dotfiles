return {
  "nvim-mini/mini.files",
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    options = {
      -- Whether to use for editing directories
      -- Enabled to let mini.files handle directory opening (hijacking netrw)
      use_as_default_explorer = true,
    },
    mappings = {
      go_in = "<CR>",
      go_out = "<BS>",
      close = "<Esc>",
      reset = "", -- reset relies on <BS> by default, confusing correct backspace behavior
    },
  },
}
