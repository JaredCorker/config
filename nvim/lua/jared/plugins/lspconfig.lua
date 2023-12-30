return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "graphql",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local on_attach = function(_, bufnr)
        local keymap = vim.keymap.set
        local attach_opts = { silent = true, buffer = bufnr }

        keymap("n", "gD", vim.lsp.buf.declaration, attach_opts)
        keymap("n", "gd", vim.lsp.buf.definition, attach_opts)
        keymap("n", "K", vim.lsp.buf.hover, attach_opts)
        keymap("n", "gi", vim.lsp.buf.implementation, attach_opts)
        keymap("n", "<C-s>", vim.lsp.buf.signature_help, attach_opts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action)
        keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, attach_opts)
        keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, attach_opts)
        keymap("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, attach_opts)
        keymap("n", "<leader>D", vim.lsp.buf.type_definition, attach_opts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, attach_opts)
        keymap("n", "so", require("telescope.builtin").lsp_references, attach_opts)
      end

      -- nvim-cmp supports additional completion capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
}
