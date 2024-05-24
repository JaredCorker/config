return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("leetcode").setup({
      lang = "typescript",
    })

    vim.keymap.set("n", "<leader>lr", "<cmd>Leet run<cr>", { desc = "Leetcode run" })
    vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<cr>", { desc = "Leetcode submit" })
  end,
}
