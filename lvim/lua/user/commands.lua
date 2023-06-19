local which_key_map = lvim.builtin.which_key.mappings
-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- Which key
which_key_map["e"] = {
  name = " Explorer",
  ["e"] = { "<cmd>NvimTreeOpen<cr>", "Explorer Open" },
  ["c"] = { "<cmd>NvimTreeClose<cr>", "Explorer Close" }
}

which_key_map["t"] = {
  name = " Terminal",
  n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
  u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
  t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
  p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
  f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
  v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
}

which_key_map["f"] = {
  name = " Find",
  ["w"] = { "<cmd>Telescope live_grep<cr>", "Find Word" },
  ["f"] = { "<cmd>Telescope find_files<cr>", "Find File" }
}

which_key_map["w"] = {
  name = " Window",
  ["v"] = { "<C-w>v", "Split window vertically" },
  ["h"] = { "<C-w>s", "Split window horizontally" },
  ["e"] = { "<C-w>=", "Split window equally" },
  ["c"] = { ":close<CR>", "Close current split window" },
}

which_key_map["h"] = {
  name = " Harpoon",
  ["h"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
  m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon Mark File" },
  ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
  [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
  ["r"] = { '<cmd>lua require("harpoon.mark").rm_file()<cr>', "Remove file from bookmarks" },
  f = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
}

-- n_mode["<S-Down>"] = ":MoveLine(1)<CR>"
-- n_mode["˚"] = ":MoveLine(-1)<CR>"
-- n_mode["˙"] = ":MoveHChar(-1)<CR>"
-- n_mode["¬"] = ":MoveHChar(1)<CR>"
-- -- n_mode["<leader>wf"] = ":MoveWord(1)<CR>"
-- -- n_mode["<leader>wb"] = ":MoveWord(-1)<CR>"

-- -- Visual-mode commands
-- v_mode["<A-j>"] = ":MoveBlock(1)<CR>"
-- v_mode["<A-k>"] = ":MoveBlock(-1)<CR>"
-- v_mode["<A-h>"] = ":MoveHBlock(-1)<CR>"
-- v_mode["<A-l>"] = ":MoveHBlock(1)<CR>"

which_key_map[","] = {
  ":MoveLine(1)<CR>", "Move Text Line Up",
}

which_key_map["."] = {
  ":MoveLine(-1)<CR>", "Move Text Line Down",
}


which_key_map[";"] = {
  "ggVG", "Select All",
}
