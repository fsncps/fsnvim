return {
    {
        "neoclide/coc.nvim",
        branch = "master",
        build = "npm ci",
        -- after install, tell coc.nvim which extensions (language servers, linters) to load
        config = function()
            -- for init.vim users you can instead put:
            -- let g:coc_global_extensions = ['coc-phpls','coc-html','coc-css','coc-tsserver',
            --                                'coc-eslint','coc-python','coc-sh','coc-go']
            vim.g.coc_global_extensions = {
                "coc-phpls", -- PHP (uses phpls / intelephense)
                "coc-html", -- HTML
                "coc-css", -- CSS/SCSS
                "coc-tsserver", -- JavaScript/TypeScript
                "coc-eslint", -- JS/TS linting via ESLint
                "coc-python", -- Python (Microsoft Pylance via pylsp)
                "coc-sh", -- Bash (bash-language-server)
                "coc-go", -- Go (gopls)
            }
        end,
    },
}
