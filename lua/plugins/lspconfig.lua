vim.o.autocomplete = true
vim.opt.complete:append("o")
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        local function map(lhs, rhs, desc, extra)
            vim.keymap.set("n", lhs, rhs,
                vim.tbl_extend("force", { buffer = ev.buf, desc = desc }, extra or {}))
        end

        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        if client:supports_method("textDocument/definition") then
            map("gd", function() Snacks.picker.lsp_definitions() end, "Goto definition")
        end
        if client:supports_method("textDocument/declaration") then
            map("gD", function() Snacks.picker.lsp_declarations() end, "Goto declaration")
        end
        if client:supports_method("textDocument/typeDefinition") then
            map("grt", function() Snacks.picker.lsp_type_definitions() end, "Goto type definition")
        end
        if client:supports_method("textDocument/references") then
            map("grr", function() Snacks.picker.lsp_references() end, "References", { nowait = true })
        end
        if client:supports_method("textDocument/implementation") then
            map("gri", function() Snacks.picker.lsp_implementations() end, "Goto implementation")
        end
        if client:supports_method("textDocument/documentSymbol") then
            map("gO", function() Snacks.picker.lsp_symbols() end, "Document symbols")
        end
    end,
})

vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "pyright",
    "gopls",
    "rust_analyzer",
    "clangd",
})
