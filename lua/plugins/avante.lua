vim.api.nvim_create_autocmd(
    'PackChanged',
    {
        callback = function(ev)
            local name, kind = ev.data.spec.name, ev.data.kind
            if name == 'avante.nvim' and (kind == 'install' or kind == 'update') then
                -- Use `make BUILD_FROM_SOURCE=true` to build from source
                vim.system({ 'make' }, { cwd = ev.data.path }):wait()
            end
        end
    }
)

vim.pack.add({
    {
        src = 'https://github.com/yetone/avante.nvim',
        version = 'main' -- default
    },
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/HakonHarnes/img-clip.nvim',
    'https://github.com/zbirenbaum/copilot.lua',
})

require('avante').setup({
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    -- provider = "claude",
    provider = "moonshot",
    providers = {
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-sonnet-4-20250514",
            timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            },
        },
        moonshot = {
            endpoint = "https://api.kimi.com/coding/v1",
            model = "kimi-for-coding",
            timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
                temperature = 1,
                -- temperature = 0.75,
                max_tokens = 32768,
            },
        },
    },
})
