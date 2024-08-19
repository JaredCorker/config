-- https://github.com/folke/trouble.nvim
-- https://github.com/nvim-tree/nvim-web-devicons
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { "<leader>tt", ":Trouble diagnostics<CR>", desc = "Trouble diagnostics" },
  },
}
