-- VimTeX for LaTeX support
return {
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      -- VimTeX configuration
      vim.g.vimtex_view_method = "skim" -- or 'zathura' on Linux
      vim.g.vimtex_compiler_method = "latexmk"
      
      -- Disable some features for better performance
      vim.g.vimtex_quickfix_mode = 0
      
      -- Enable folding
      vim.g.vimtex_fold_enabled = 1
    end,
  },
}
