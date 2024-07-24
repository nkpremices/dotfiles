local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local h_status_ok, harpoon = pcall(require, "harpoon")
if not h_status_ok then
  print("Harpoon not found", harpoon)
  return
end

local which_key_map = lvim.builtin.which_key.mappings


harpoon:setup({
  settings = {
    save_on_toggle = true,
  },
})

local toggle_quick_menu = function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
local mark_file = function() harpoon:list():append() end
local next_file = function() harpoon:list():next() end
local prev_file = function() harpoon:list():prev() end

which_key_map["h"] = {
  name = " Harpoon",
  h = { toggle_quick_menu, "Harpoon UI" },
  m = { mark_file, "Harpoon Mark File" },
  ["."] = { next_file, "Harpoon Next" },
  [","] = { prev_file, "Harpoon Prev" },
  -- ["r"] = { '<cmd>lua require("harpoon.mark").rm_file()<cr>', "Remove file from bookmarks" },
  -- f = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
}

telescope.load_extension "harpoon"
