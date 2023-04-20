local colorscheme = "gruvbox"
vim.o.background = "dark"

local loaded, gruvbox = pcall(require, "gruvbox")
if not loaded then
  vim.notify("colorsheme -- gruvbox loading failed")
  return
end

gruvbox.setup({
  transparent_mode = true
})



local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

