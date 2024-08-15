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
        "eslint",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local on_attach = function(_, bufnr)
        local keymap = vim.keymap.set
        local attach_opts = { silent = true, buffer = bufnr }
        local buf = vim.lsp.buf

        keymap("n", "gD", buf.declaration, attach_opts)
        keymap("n", "gd", buf.definition, attach_opts)
        keymap("n", "gh", buf.hover, attach_opts)
        keymap("n", "gi", buf.implementation, attach_opts)
        keymap("n", "<C-s>", buf.signature_help, attach_opts)
        keymap("n", "<leader>ca", buf.code_action)
        keymap("n", "<leader>wa", buf.add_workspace_folder, attach_opts)
        keymap("n", "<leader>wr", buf.remove_workspace_folder, attach_opts)
        keymap("n", "<leader>wl", function()
          print(vim.inspect(buf.list_workspace_folders()))
        end, attach_opts)
        keymap("n", "<leader>D", buf.type_definition, attach_opts)
        keymap("n", "<leader>rn", buf.rename, attach_opts)
        keymap("n", "<leader>lr", ":LspRestart<CR>", attach_opts)
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

      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig.bashls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
}
