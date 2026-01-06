-- Neo-tree file explorer configuration
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>ee",
        function()
          require("neo-tree.command").execute({ action = "focus" })
        end,
        desc = "Explorer: Focus",
      },
      {
        "<leader>ec",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer: Toggle",
      },
    },
    opts = {
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      hijack_netrw_behavior = false,
      
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
          default = "",
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            -- Change type
            added     = "●",
            modified  = "●",
            deleted   = "●",
            renamed   = "●",
            -- Status type
            untracked = "●",
            ignored   = "●",
            unstaged  = "●",
            staged    = "●",
            conflict  = "●",
          },
        },
      },
      
      window = {
        position = "left",
        width = 40,
        mappings = {
          ["<space>"] = "none",
          ["<esc>"] = "none", -- Disable escape closing
          ["q"] = "close_window",
        },
      },
      
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
          },
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
    },
    config = function(_, opts)
      -- Set custom highlights for blue folder icons
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#468488" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#83A697" })
      
      require("neo-tree").setup(opts)
    end,
  },
}
