-- Disable LazyVim's default keymaps that conflict with our preferences
return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        -- Disable LazyVim's default leader+/ for grep
        ["<leader>/"] = nil,
        -- Disable LazyVim's default leader+space for file search
        ["<leader><space>"] = nil,
        -- Disable LazyVim's default leader+l for Lazy UI (conflicts with LSP actions)
        ["<leader>l"] = nil,
      },
    },
  },
}
