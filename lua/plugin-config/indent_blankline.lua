local status, indent_blankline = pcall(require, "ibl")
if not status then
	vim.notify("没有找到 indent_blankline")
	return
end

vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↵")
indent_blankline.setup({
	-- for example, context is off by default, use this to turn it on
	-- show_current_context = true,
	-- show_current_context_start = false,
	-- echo &filetype
	exclude = {
        filetypes = {
            "null-ls-info",
            "dashboard",
            "packer",
            "terminal",
            "help",
            "log",
            "markdown",
            "TelescopePrompt",
            "lspinfo",
            "mason.nvim",
            "toggleterm",
            "lspsagaoutline",
            "text",
        }
	},
})
