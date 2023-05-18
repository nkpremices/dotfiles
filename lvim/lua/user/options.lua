local options = {
  -- cmdheight = 2,         -- more space in the neovim command line for displaying messages
  shiftwidth = 2,        -- the number of spaces inserted for each indentation
  tabstop = 2,           -- insert 2 spaces for a tab
  relativenumber = true, -- set relative numbered lines
  cursorcolumn = false   -- puts the vertical line
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

-- More vim options that cannot be set in the table above
vim.opt.iskeyword:append "-" -- hyphenated words recognized by searches

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}

-- Lualine

lvim.builtin.lualine.sections.lualine_c = { '%f' } -- Add file path in lualine

-- Format on save
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py", "*.ex", "*.exs", "*.heex" }

-- change icon of closed directory nvim tree (explorer)
