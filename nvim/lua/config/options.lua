-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ============================================================================
-- MIGRATED FROM LUNARVIM
-- ============================================================================

local opt = vim.opt

-- ----------------------------------------------------------------------------
-- Fillchars - Clean UI appearance
-- Hide end-of-buffer tildes and vertical split characters
-- ----------------------------------------------------------------------------
vim.wo.fillchars = "vert: ,eob: "
vim.o.fillchars = "eob: "

-- ----------------------------------------------------------------------------
-- Indentation
-- NOTE: LazyVim already sets these to 2, but keeping for clarity
-- ----------------------------------------------------------------------------
opt.shiftwidth = 2
opt.tabstop = 2

-- ----------------------------------------------------------------------------
-- Cursor Column
-- Shows a vertical line at the cursor position
-- ----------------------------------------------------------------------------
opt.cursorcolumn = true

-- ----------------------------------------------------------------------------
-- Folding with Treesitter
-- NOTE: LazyVim may use nvim-ufo for folding, but keeping Treesitter method
-- ----------------------------------------------------------------------------
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99 -- All folds open by default
opt.foldlevelstart = 99 -- All folds open on buffer open
opt.foldenable = true

-- ----------------------------------------------------------------------------
-- Keyword Recognition
-- Treat hyphenated words as a single word in searches
-- ----------------------------------------------------------------------------
opt.iskeyword:append("-")

-- ----------------------------------------------------------------------------
-- Diagnostics Configuration
-- Show virtual text for errors (including ESLint), but not warnings/hints
-- ----------------------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR }, -- Only show errors inline
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- ----------------------------------------------------------------------------
-- Project Root Detection
-- Detect project root by looking for specific patterns
-- NOTE: LazyVim uses vim.g.root_spec for this
-- ----------------------------------------------------------------------------
vim.g.root_spec = {
  { ">Projects", ".git" }, -- Look for Projects directory or .git
  "lsp",                   -- Fallback to LSP root detection
  { "lua", ".luarc.json" }, -- Lua projects
  "cwd",                   -- Fallback to current working directory
}

-- ----------------------------------------------------------------------------
-- Filetype Detection
-- Gotmpl and Helm template support
-- ----------------------------------------------------------------------------
vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
