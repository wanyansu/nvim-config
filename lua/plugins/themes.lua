vim.pack.add({
    { src = "https://github.com/catppuccin/nvim",      name = "catppuccin" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/rebelot/kanagawa.nvim" },
})

-- require("gruvbox").setup()
-- require("kanagawa").setup()
-- require("catppuccin").setup({
--     flavour = "macchiato", -- latte, frappe, macchiato, mocha
--     transparent_background = true,
-- })

-- vim.cmd.colorscheme "catppuccin-nvim"
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd("colorscheme kanagawa")
vim.cmd.colorscheme("miniwinter")
