lvim.leader = "space"

local n_mode = lvim.keys.normal_mode
local vb_mode = lvim.visual_block_mode
local vl_mode = lvim.visual_line_mode
local v_mode = lvim.visual_mode

-- add your own keymapping
n_mode["<C-s>"] = ":w<cr>"

-- n_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- n_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- clear search highlights
n_mode["<leader>nh"] = ":nohl<CR>"

-- delete single character without copying into register
n_mode["x"] = '"_x'
n_mode["d"] = '"_d'
v_mode["d"] = '"_d'
n_mode["c"] = '"_c'
v_mode["c"] = '"_c'

vb_mode["d"] = '"_d'
vb_mode["c"] = '"_c'

vl_mode["d"] = '"_d'
vl_mode["c"] = '"_c'

-- X closes a buffer
n_mode["<S-c>"] = ":BufferKill<CR>"

-- Centers cursor when moving 1/2 page up and down
n_mode["<C-d>"] = "<C-d>zz"
n_mode["<C-u>"] = "<C-u>zz"


-- while in search, always center when going to the next iteration
n_mode["n"] = "nzzzv"
n_mode["N"] = "Nzzzv"

-- n_mode["<leader>to"] = ":tabnew<CR>"   -- open new tab
-- n_mode["<leader>tc"] = ":tabclose<CR>" -- close current tab
-- n_mode["<leader>tn"] = ":tabn<CR>"     --  go to next tab
-- n_mode["<leader>tp"] = ":tabp<CR>"     --  go to previous tab

-- pasting without losing the content of the paste register
vb_mode["<leader>p"] = "\"_dP"

-- Move text up and down
-- v_mode["<A-j>"] = ":m .+1<CR>==gv"
-- v_mode["<A-k>"] = ":m .-2<CR>==gv"
