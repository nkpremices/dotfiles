-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable LazyVim's terminal error checking (if it exists)
pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_terminal")

-- Auto-close terminal buffer on exit without error messages
vim.api.nvim_create_autocmd("TermClose", {
  group = vim.api.nvim_create_augroup("custom_terminal", { clear = true }),
  pattern = "*",
  callback = function()
    vim.schedule(function()
      vim.cmd("bdelete!")
    end)
  end,
})
