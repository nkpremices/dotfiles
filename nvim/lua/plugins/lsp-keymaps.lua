-- LSP Keymaps matching LunarVim defaults
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Apply these keymaps to all LSP servers
        ["*"] = {
          keys = {
            -- Navigation
            { "K", vim.lsp.buf.hover, desc = "Hover" },
            { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
            { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
            { "gr", vim.lsp.buf.references, desc = "References" },
            { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
            { "gs", vim.lsp.buf.signature_help, desc = "Signature Help" },

            -- Diagnostics
            { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" },
            {
              "<leader>lj",
              function()
                vim.diagnostic.jump({ count = 1, float = true })
              end,
              desc = "Prev Diagnostic",
            },
            {
              "<leader>lk",
              function()
                vim.diagnostic.jump({ count = -1, float = true })
              end,
              desc = "Next Diagnostic",
            },

            -- LSP Actions
            { "<leader>lf", vim.lsp.buf.format, desc = "Format" },
            { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
            { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Installer" },
            { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
            { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
            { "<leader>ls", vim.lsp.buf.document_symbol, desc = "Document Symbols" },
            { "<leader>lS", vim.lsp.buf.workspace_symbol, desc = "Workspace Symbols" },
          },
        },
      },
    },
  },
}
