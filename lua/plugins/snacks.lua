vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
    -- { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local Snacks = require("snacks")

Snacks.setup({
    picker = { enabled = true, },
})

vim.keymap.set("n", "<leader>fs", function() Snacks.picker.smart() end, { desc = "Smart find files" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help pages" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.resume() end, { desc = "Resume picker" })
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
