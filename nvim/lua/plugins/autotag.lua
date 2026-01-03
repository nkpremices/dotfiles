-- nvim-ts-autotag for auto-closing HTML/JSX tags
-- NOTE: LazyVim includes this by default, but adding explicit config
return {
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
