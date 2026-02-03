vim.diagnostic.config({
    virtual_text = {
        source = true, -- "always", -- Or "if_many"
        prefix = "●", -- Could be '■', '▎', 'x'
        spacing = 20,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        },
    },
    severity_sort = true,
    float = {
        source = true, -- "always", -- Or "if_many"
        border = "double",
    },
})
require("lspconfig.ui.windows").default_options.border = "double"
