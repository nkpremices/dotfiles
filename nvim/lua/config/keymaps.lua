-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ============================================================================
-- MIGRATED FROM LUNARVIM
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Productivity Keymaps
-- ----------------------------------------------------------------------------

-- Quick save with Ctrl+S
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- Disable LazyVim's default <leader>l mapping (Lazy UI) causing conflict with LSP keymaps
pcall(vim.keymap.del, "n", "<leader>l")

-- Clear search highlights
vim.keymap.set("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Clear search highlights" })

-- Close buffer (LazyVim uses <leader>bd for buffer delete, mapping to Shift+C for compatibility)
vim.keymap.set("n", "<S-c>", "<cmd>bd<cr>", { desc = "Close buffer" })

-- ----------------------------------------------------------------------------
-- Register Management (Black Hole Register)
-- Prevents delete/change operations from yanking to clipboard
-- ----------------------------------------------------------------------------

-- Normal mode: x, d, c go to black hole register
vim.keymap.set("n", "x", '"_x', { desc = "Delete char (black hole)" })
vim.keymap.set("n", "d", '"_d', { desc = "Delete (black hole)" })

-- Visual mode: d, c go to black hole register
vim.keymap.set("v", "d", '"_d', { desc = "Delete (black hole)" })

-- Visual-block mode: d, c go to black hole register
vim.keymap.set("x", "d", '"_d', { desc = "Delete (black hole)" })

-- ----------------------------------------------------------------------------
-- Cursor Centering During Navigation
-- ----------------------------------------------------------------------------

-- Center cursor when moving half-page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Center cursor when navigating search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- ----------------------------------------------------------------------------
-- Paste Without Losing Register Content
-- ----------------------------------------------------------------------------

-- In visual-block and visual modes, paste without losing the clipboard content
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste (preserve register)" })

-- ----------------------------------------------------------------------------
-- Explorer (Neo-tree)
-- Keymaps are defined in lua/plugins/neo-tree.lua
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- Commenting
-- ----------------------------------------------------------------------------

-- Toggle comment with leader+/ (uses LazyVim's built-in gc operator)
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- ----------------------------------------------------------------------------
-- Find (Telescope)
-- NOTE: LazyVim already has Telescope configured with these defaults:
--   <leader>ff - Find files
--   <leader>fg - Live grep (find in files)
--   <leader>fb - Buffers
-- ----------------------------------------------------------------------------
-- Window & UI Resizing
-- ----------------------------------------------------------------------------

-- Resize window width (Right/Left)
-- Useful for expanding/shrinking Neo-tree or splits
vim.keymap.set("n", "<Esc><Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "<Esc><Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

-- Resize command line height (Up/Down)
-- Expands/shrinks the space where ':' commands are written
vim.keymap.set("n", "<Esc><Up>", "<cmd>set cmdheight+=1<cr>", { desc = "Increase command line height" })
vim.keymap.set("n", "<Esc><Down>", "<cmd>set cmdheight-=1<cr>", { desc = "Decrease command line height" })
-- ----------------------------------------------------------------------------

vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word (live grep)" })
-- <leader>ff already exists in LazyVim by default

-- ----------------------------------------------------------------------------
-- Window Management
-- NOTE: LazyVim has default window management, adding custom mappings
-- ----------------------------------------------------------------------------

vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close current split" })

-- ----------------------------------------------------------------------------
-- Text Movement (move.nvim)
-- NOTE: Configured in lua/plugins/move.lua
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- Selection
-- ----------------------------------------------------------------------------

vim.keymap.set("n", "<leader>;", "ggVG", { desc = "Select all" })

-- ----------------------------------------------------------------------------
-- Terminal (Snacks)
-- NOTE: LazyVim uses snacks.nvim for terminal management
-- LazyVim's default is <C-/> to toggle terminal
-- Mapping your familiar <leader>t keymaps to Snacks terminal
-- ----------------------------------------------------------------------------

-- Float terminal (default)
vim.keymap.set("n", "<leader>tf", function()
  Snacks.terminal(nil, {
    win = {
      style = "float",
      border = "rounded",
      width = 0.83,
      height = 0.83,
    },
    env = {
      TERM = "xterm-256color",
    },
  })
end, { desc = "Terminal (float)" })

-- Horizontal terminal
vim.keymap.set("n", "<leader>th", function()
  Snacks.terminal(nil, { win = { position = "bottom", height = 0.3 } })
end, { desc = "Terminal (horizontal)" })

-- Vertical terminal
vim.keymap.set("n", "<leader>tv", function()
  Snacks.terminal(nil, { win = { position = "right", width = 0.4 } })
end, { desc = "Terminal (vertical)" })

-- Specific REPL terminals
vim.keymap.set("n", "<leader>tn", function()
  Snacks.terminal("node")
end, { desc = "Terminal: Node" })

vim.keymap.set("n", "<leader>tp", function()
  Snacks.terminal("python")
end, { desc = "Terminal: Python" })

vim.keymap.set("n", "<leader>tt", function()
  Snacks.terminal("htop")
end, { desc = "Terminal: Htop" })

-- Note: NCDU requires ncdu to be installed (brew install ncdu)
vim.keymap.set("n", "<leader>tu", function()
  Snacks.terminal("ncdu")
end, { desc = "Terminal: NCDU" })

-- ----------------------------------------------------------------------------
-- Harpoon (File Navigation)
-- NOTE: Configured in lua/plugins/harpoon.lua
-- ----------------------------------------------------------------------------


