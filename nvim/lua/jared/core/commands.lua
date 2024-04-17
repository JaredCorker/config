local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 100,
    })
  end,
  group = augroup("HighlightYank", {}),
})

autocmd("BufWritePre", {
  pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
  command = "silent! EslintFixAll",
  group = augroup("FormatTS", {}),
})

autocmd("BufWritePre", {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format()
  end,
  group = augroup("FormatLua", {}),
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "/Users/jared.corker/.local/share/nvim/leetcode/*",
  command = "Copilot disable",
  group = augroup("DisableCopilot", {}),
})
