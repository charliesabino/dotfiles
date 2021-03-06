require'nvim-treesitter.configs'.setup({
    ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
    },
    indent = { enable = true, disable = { "python", "css" } },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    }
})
