-- move.nvim - Move lines and characters
return {
  "hinell/move.nvim",
  config = function()
    -- Keymaps for moving lines up and down
    vim.keymap.set("n", "<leader>,", ":MoveLine 1<cr>", { desc = "Move line down", silent = true })
    vim.keymap.set("n", "<leader>.", ":MoveLine -1<cr>", { desc = "Move line up", silent = true })

    -- Optional: Add visual mode block movement if needed
    vim.keymap.set("v", "<leader>,", ":MoveBlock 1<cr>", { desc = "Move block down", silent = true })
    vim.keymap.set("v", "<leader>.", ":MoveBlock -1<cr>", { desc = "Move block up", silent = true })
  end,
}
