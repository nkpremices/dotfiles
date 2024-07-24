-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua", filetypes = { "*.lua" }
  },
  {
    command = "prettierd",
    extra_args = { " --write \"**/*.{ts,tsx,md}\"" },
    args = {},
    filetypes = { "typescript", "typescriptreact", "javascript", "typescript", "*.tsx", "*.jsx" },
  },
  {
    command = "eslint_d",
    args = { "--fix" },
    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
  },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  {
    command = "eslint_d",
    -- args = { "--fix" },
    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
  },
})
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
})
