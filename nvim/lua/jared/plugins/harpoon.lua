return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon.setup()
    -- REQUIRED

    local keymap = vim.keymap.set

    keymap("n", "<leader>hh", function()
      harpoon:list():append()
    end, { desc = "Add file to harpoon" })
    keymap("n", "<leader>fh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open harpoon file menu" })

    keymap("n", "<leader>fj", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon file 1" })
    keymap("n", "<leader>fk", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon file 2" })
    keymap("n", "<leader>fl", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon file 3" })
    keymap("n", "<leader>f;", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon file 4" })
  end,
}
