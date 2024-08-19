-- https://github.com/princejoogie/dir-telescope.nvim
return {
  "princejoogie/dir-telescope.nvim",
  -- telescope.nvim is a required dependency
  requires = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("dir-telescope").setup({
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
    })
    require("telescope").load_extension("dir")

    vim.keymap.set("n", "<leader>fdf", "<cmd>FileInDirectory<CR>", { desc = "Find files in dir" })
    vim.keymap.set("n", "<leader>fds", "<cmd>GrepInDirectory<CR>", { desc = "Find string in dir" })
  end,
}
