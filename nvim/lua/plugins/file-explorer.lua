return {
  "nvim-mini/mini.files",
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 80,
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
  config = function(_, opts)
    require("mini.files").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        vim.keymap.set("n", "<CR>", function()
          require("mini.files").go_in({ close_on_file = true })
        end, { buffer = args.data.buf_id, desc = "Go in (Auto Close)" })
      end,
    })
  end,
}
