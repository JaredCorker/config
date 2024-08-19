-- https://github.com/stevearc/oil.nvim
-- https://github.com/nvim-tree/nvim-web-devicons
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", ":Oil<CR>" },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
}
