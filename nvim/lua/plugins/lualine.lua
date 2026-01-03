-- Add Copilot status to lualine
return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      -- Add LSP server icons with clean styling
      local lsp_servers = {
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if #clients == 0 then
            return ""
          end
          
          -- Icon mapping for LSP servers
          local icons = {
            copilot  = "󰚩", -- robot / AI
            emmet_ls = "󰘎", -- lightning / expansion
            eslint   = "󰱺", -- check / lint
            vtsls    = "󰛦", -- TypeScript (server)
            ts_ls    = "󰛦", -- TypeScript (same semantic role)
            lua_ls   = "󰢱", -- Lua
            bashls   = "󰆍", -- Bash
          }
          
          local names = {}
          for _, client in ipairs(clients) do
            local icon = icons[client.name]
            if icon then
              table.insert(names, icon)
            else
              table.insert(names, client.name)
            end
          end
          return "LSP " .. table.concat(names, " ")
        end,
        color = { fg = "#c0caf5", bg = "#565f89" }, -- Light text on brighter background
        separator = { left = "", right = " " }, -- Powerline triangles
        padding = { left = 1, right = 1 },
      }
      
      -- Insert at the beginning of lualine_x (right side, before other components)
      table.insert(opts.sections.lualine_x, 1, lsp_servers)
    end,
  },
}
