vim.opt.number = true

vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 100

vim.opt.tabstop = 4
-- fall back to tabstop
vim.opt.shiftwidth = 0

vim.opt.virtualedit = "block"

vim.opt.termguicolors = true

vim.o.signcolumn = "yes"
vim.diagnostic.config({
	virtual_lines = true,
	update_in_insert = true,
})

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.o.winborder = "single"
