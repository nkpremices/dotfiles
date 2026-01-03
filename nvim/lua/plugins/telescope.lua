-- Telescope configuration
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
        horizontal = {
          mirror = false,
          preview_width = 0.5,
        },
        vertical = {
          mirror = false,
        },
        width = 0.75,
        height = 0.85,
        preview_cutoff = 120,
      },
      sorting_strategy = "ascending", -- Results start from top
    },
  },
}
