local options = {
  -- cmdheight = 2,         -- more space in the neovim command line for displaying messages
  shiftwidth = 2,        -- the number of spaces inserted for each indentation
  tabstop = 2,           -- insert 2 spaces for a tab
  relativenumber = true, -- set relative numbered lines
  cursorcolumn = true    -- puts the vertical line
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
  pattern = {
    "*.lua",
    "*.py",
    "*.ex",
    "*.exs",
    "*.heex",
    "*.ts",
    "*.tsx",
    "*.js",
    "*.jsx",
    "*.json"
  },
  timeout = 1000,
}

-- Lualine

lvim.builtin.lualine.sections.lualine_c = { 'filename' }                      -- Add file path in lualine
lvim.builtin.lualine.sections.lualine_b = { 'branch', 'diff', 'diagnostics' } -- Add file path in lualine

-- Format on save
lvim.format_on_save.enabled = true

-- don't give |ins-completion-menu| messages
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

-- Telescope

local telescopeConf = {
  layout_strategy = "horizontal",
  layout_config = {
    prompt_position = "top",
    horizontal = {
      mirror = false,
      preview_width = 0.5,
    },
    vertical = {
      mirror = false,
    },
    width = 0.75,
    height = 0.85,
    preview_cutoff = 120,
  },
}

lvim.builtin.telescope.pickers.live_grep = telescopeConf;
lvim.builtin.telescope.pickers.find_files = telescopeConf;
