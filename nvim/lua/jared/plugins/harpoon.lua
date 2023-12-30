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

    keymap("n", "<leader>h", function() harpoon:list():append() end, { desc = "Add file to harpoon" })
    keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- keymap("n", "<C-u>", function() harpoon:list():select(1) end)
    -- keymap("n", "<C-i>", function() harpoon:list():select(2) end)
    -- keymap("n", "<C-o>", function() harpoon:list():select(3) end)
    -- keymap("n", "<C-p>", function() harpoon:list():select(4) end)
  end
}
