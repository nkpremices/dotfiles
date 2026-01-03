-- Formatting with conform.nvim (replaces null-ls formatters)
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- JavaScript/TypeScript - use prettierd for formatting
      -- ESLint fixes are handled by the linting.eslint extra
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      
      -- JSON
      json = { "prettierd" },
      jsonc = { "prettierd" },
      
      -- Markdown
      markdown = { "prettierd" },
      
      -- Lua
      lua = { "stylua" },
      
      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },
    },
    
    -- Formatters configuration
    formatters = {
      prettierd = {
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.prettierrc"),
        },
      },
    },
  },
}
