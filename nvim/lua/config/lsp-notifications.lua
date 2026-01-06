-- Plugin to control LSP error notifications
-- Prevents blocking "Press ENTER" messages from crashing LSPs

local M = {}

-- State
local config = {
  suppress_errors = true, -- Default to true as requested
  excluded_servers = {}, -- E.g. {"null-ls"} if needed
}

function M.setup()
  -- Override vim.notify to filter out LSP errors when suppression is on
  local original_notify = vim.notify

  vim.notify = function(msg, level, opts)
    opts = opts or {}

    -- Check if it's an ERROR level message
    if config.suppress_errors and level == vim.log.levels.ERROR then
      -- Check if it looks like an LSP message
      -- Many LSPs set title to the server name
      local is_lsp = opts.title
        and (
          opts.title == "LSP"
          or opts.title == "vtsls"
          or opts.title == "tsserver"
          or vim.tbl_contains(config.excluded_servers, opts.title)
        )

      -- Also check message content for common LSP keywords if title is missing
      if not is_lsp and msg then
        is_lsp = msg:match("LSP%[") or msg:match("Language server")
      end

      if is_lsp then
        -- Silently ignore the error
        -- Optionally: log it to a file or special buffer instead of showing it
        return
      end
    end

    return original_notify(msg, level, opts)
  end

  -- Override window/showMessage to suppress error modals
  local original_window_show_message = vim.lsp.handlers["window/showMessage"]
  vim.lsp.handlers["window/showMessage"] = function(err, result, ctx, config_overrides)
    if config.suppress_errors and result.type == vim.lsp.protocol.MessageType.Error then
      -- Suppress error messages
      return
    end
    return original_window_show_message(err, result, ctx, config_overrides)
  end

  -- Create toggle command
  vim.api.nvim_create_user_command("ToggleLspErrors", function()
    config.suppress_errors = not config.suppress_errors
    local status = config.suppress_errors and "SUPPRESSED" or "ENABLED"
    vim.notify("LSP Errors: " .. status, vim.log.levels.INFO, { title = "LSP Settings" })
  end, { desc = "Toggle suppression of LSP error messages" })
end

M.setup()

return M
