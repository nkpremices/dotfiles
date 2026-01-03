-- ESLint configuration with auto-fix on save
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- ESLint auto-fix on save
      linters = {
        eslint_d = {
          args = {
            "--format",
            "json",
            "--stdin",
            "--stdin-filename",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          settings = {
            -- Auto-fix on save
            codeActionOnSave = {
              enable = true,
              mode = "all",
            },
            format = true,
          },
        },
      },
      setup = {
        eslint = function()
          -- Auto-fix ESLint issues on save using LSP code actions
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
            callback = function()
              -- Apply ESLint fixes via code action
              local params = vim.lsp.util.make_range_params(nil, "utf-16")
              params.context = {
                only = { "source.fixAll.eslint" },
                diagnostics = {},
              }
              
              local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
              if not result or vim.tbl_isempty(result) then
                return
              end
              
              for _, res in pairs(result) do
                for _, action in pairs(res.result or {}) do
                  if action.edit then
                    vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
                  end
                end
              end
            end,
          })
        end,
      },
    },
  },
}
