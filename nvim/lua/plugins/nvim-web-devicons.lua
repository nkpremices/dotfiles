-- Ensure nvim-web-devicons is properly loaded
return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false, -- Load immediately
    config = function()
      require("nvim-web-devicons").setup({
        override = {},
        default = true,
        strict = true,
      })
    end,
  },
}
