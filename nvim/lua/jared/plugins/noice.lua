return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup()

    vim.keymap.set("n", "<leader>nn", ":Noice dismiss<CR>", { desc = "Dismiss notifications" })
  end,
}
