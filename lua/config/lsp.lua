vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "Snacks" },
            },
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                preloadFileSize = 10000,
                library = {
                    vim.env.VIMRUNTIME,
                }
            },
        },
    },
})

vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "pyright",
    "gopls",
})
