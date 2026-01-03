-- Harpoon 2 - Quick file navigation
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    -- Setup harpoon with settings from LunarVim config
    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })

    -- Load telescope extension
    require("telescope").load_extension("harpoon")

    -- Keymaps (migrated from LunarVim)
    vim.keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon UI" })

    vim.keymap.set("n", "<leader>hm", function()
      harpoon:list():append()
    end, { desc = "Harpoon mark file" })

    vim.keymap.set("n", "<leader>h.", function()
      harpoon:list():next()
    end, { desc = "Harpoon next" })

    vim.keymap.set("n", "<leader>h,", function()
      harpoon:list():prev()
    end, { desc = "Harpoon previous" })
  end,
}
