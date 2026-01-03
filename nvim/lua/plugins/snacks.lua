-- Disable Snacks explorer (using neo-tree instead)
return {
  {
    "folke/snacks.nvim",
    opts = {
      -- Disable toast notifications
      notifier = {
        enabled = false,
      },
      -- Disable explorer (using neo-tree)
      explorer = {
        enabled = false,
      },
    },
    keys = {
      -- Disable the default <leader>e keybinding
      { "<leader>e", false },
    },
  },
}
