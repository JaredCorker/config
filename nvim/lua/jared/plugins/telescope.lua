vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local egrep_actions = require("telescope._extensions.egrepify.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate " },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next,     -- move to next result
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            path_display = filenameFirst,
          },
          oldfiles = {
            path_display = filenameFirst,
          },
          lsp_references = {
            path_display = filenameFirst,
          },
        },
        extensions = {
          egrepify = {
            -- intersect tokens in prompt ala "str1.*str2" that ONLY matches
            -- if str1 and str2 are consecutively in line with anything in between (wildcard)
            AND = true,                   -- default
            permutations = false,         -- opt-in to imply AND & match all permutations of prompt tokens
            lnum = true,                  -- default, not required
            lnum_hl = "EgrepifyLnum",     -- default, not required, links to `Constant`
            col = false,                  -- default, not required
            col_hl = "EgrepifyCol",       -- default, not required, links to `Constant`
            title = true,                 -- default, not required, show filename as title rather than inline
            filename_hl = "EgrepifyFile", -- default, not required, links to `Title`
            -- suffix = long line, see screenshot
            -- EXAMPLE ON HOW TO ADD PREFIX!
            prefixes = {
              -- ADDED ! to invert matches
              -- example prompt: ! sorter
              -- matches all lines that do not comprise sorter
              -- rg --invert-match -- sorter
              ["!"] = {
                flag = "invert-match",
              },
              -- HOW TO OPT OUT OF PREFIX
              -- ^ is not a default prefix and safe example
              ["^"] = false,
            },
            -- default mappings
            mappings = {
              i = {
                -- toggle prefixes, prefixes is default
                ["<C-z>"] = egrep_actions.toggle_prefixes,
                -- toggle AND, AND is default, AND matches tokens and any chars in between
                ["<C-a>"] = egrep_actions.toggle_and,
                -- toggle permutations, permutations of tokens is opt-in
                ["<C-r>"] = egrep_actions.toggle_permutations,
              },
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("egrepify")

      -- set keymaps
      local keymap = vim.keymap.set

      keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      keymap("n", "<leader>fs", "<cmd>Telescope egrepify<cr>", { desc = "Find string in cwd" })
      keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
      keymap("n", "<leader>fgg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find files inside git repository" })
      keymap("n", "<leader>fgc", "<cmd>Telescope git_status<cr>", { desc = "Fuzzy find files with git changes" })
      keymap("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find buffers" })
      keymap("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume last search" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
