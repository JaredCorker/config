return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>hn",  ":Gitsigns prev_hunk<CR>",    desc = "Prev hunk" },
    { "<leader>nh",  ":Gitsigns next_hunk<CR>",    desc = "Next hunk" },
    { "<leader>grh", ":Gitsigns reset_hunk<CR>",   desc = "Reset hunk" },
    { "<leader>grb", ":Gitsigns reset_buffer<CR>", desc = "Reset buffer" },
  },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 0,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
  },
}
