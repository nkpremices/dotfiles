return {
  "nvim-lua/plenary.nvim", -- Utility library for path handling
  config = function()
    local group = vim.api.nvim_create_augroup("WorkspaceRestore", { clear = true })
    local persistence_file = ".wspfiles"

    -- Helper to get project root
    local function get_project_root()
      return LazyVim.root.get()
    end

    -- Store path in memory to avoid constant disk writes
    local current_session_file = nil

    -- Track current file in memory
    vim.api.nvim_create_autocmd("BufEnter", {
      group = group,
      pattern = "*",
      callback = function()
        local file = vim.fn.expand("%:p")
        -- Only track normal files that exist
        if file == "" or vim.bo.buftype ~= "" or not vim.loop.fs_stat(file) then return end

        local root = get_project_root()
        -- If file is not inside the current root, ignore
        if not vim.startswith(file, root) then return end
        
        -- Store just the relative path in memory
        current_session_file = vim.fn.fnamemodify(file, ":.")
      end,
    })

    -- Write to disk ONLY when quitting
    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = group,
      callback = function()
        if not current_session_file then return end
        
        local root = get_project_root()
        local wsp_path = root .. "/" .. persistence_file
        local fd = io.open(wsp_path, "w")
        if fd then
          fd:write(current_session_file)
          fd:close()
        end
      end,
    })

    -- Restore last opened file on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      group = group,
      callback = function()
        -- Schedule the check to ensure plugins/LSP are ready
        vim.schedule(function()
            -- Only restore if no arguments were passed (e.g. nvim .)
            -- Determine if we should restore
            local should_restore = false
            if vim.fn.argc() == 0 then
              should_restore = true
            elseif vim.fn.argc() == 1 then
              -- If the only argument is a directory (e.g. nvim .), we still want to restore
              local arg = vim.fn.argv(0)
              if vim.fn.isdirectory(arg) == 1 then
                should_restore = true
              end
            end

            if not should_restore then return end

            local root = get_project_root()
            local wsp_path = root .. "/" .. persistence_file
            
            local fd = io.open(wsp_path, "r")
            if fd then
              local relative_path = fd:read("*line")
              fd:close()
              
              if relative_path and relative_path ~= "" then
                 local full_path = root .. "/" .. relative_path
                 if vim.loop.fs_stat(full_path) then
                   vim.cmd("edit " .. full_path)
                 end
              end
            end
        end)
      end,
    })
  end
}
