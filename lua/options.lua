vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.opt.winborder = "rounded"

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Format files in the buffer" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source config file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source " })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source selected lines of code" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format files in the buffer" })
vim.keymap.set("n", "<leader><leader>l", function() vim.pack.update() end, { desc = "Update vim packages" })

vim.cmd(":hi statusline guibg=NONE")
