vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Update tree-sitter parsers when nvim-treesitter changes",
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind ~= "delete" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
  "bash",
  "c",
  "css",
  "diff",
  "html",
  "go",
  "javascript",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "rust",
  "vimdoc",
  "yaml",
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable treesitter highlighting, folds and indentation",
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then
      return
    end

    -- Highlighting (provided by Neovim core).
    -- pcall keeps this silent for filetypes whose parser isn't installed.
    if not pcall(vim.treesitter.start, ev.buf, lang) then
      return
    end

    -- Folding (provided by Neovim core).
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"

    -- Indentation (provided by nvim-treesitter; still experimental).
    -- Note the quoting: double outside, single inside.
    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Start with everything unfolded, otherwise files open fully collapsed.
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
