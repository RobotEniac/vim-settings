-- Setup lspconfig.

local lspconfig
status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("没有找到 lspconfig")
	return
end

-- Enable the gopls language server
vim.lsp.enable("gopls")

-- Optional: Add extra configuration for gopls (e.g., specific analyzers, formatting on save)
vim.lsp.config("gopls", {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    -- Optional: Format on save
    -- This requires a separate auto command setup or a dedicated formatting plugin
    -- autocmd BufWritePre *.go lua vim.lsp.buf.format()
})

