-- Use blink.cmp (LazyVim default) with Copilot in completion menu
return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      completion = {
        ghost_text = {
          enabled = false, -- Disable ghost text, only show in menu
        },
      },
      appearance = {
        kind_icons = {
          Copilot = "",
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false }, -- Disable inline, use completion menu
      panel = { enabled = false },
      filetypes = {
        javascript = true,
        typescript = true,
        javascriptreact = true,
        typescriptreact = true,
        python = true,
        lua = true,
        go = true,
        rust = true,
        ["*"] = false,
      },
    },
  },
}
