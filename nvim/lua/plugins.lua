-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"sainnhe/everforest",
		config = function()
			vim.cmd.colorscheme("everforest")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local languages = {
				"c",
				"cpp",
				"css",
				"desktop",
				"gitignore",
				"glsl",
				"html",
				"javascript",
				"json",
				"lua",
				"make",
				"markdown"
			}
			require("nvim-treesitter").install(languages)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function() vim.treesitter.start() end,
			})
			vim.bo.indentexpr = "v:lua.require(\"nvim-treesitter\").indentexpr()"
		end
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		'saghen/blink.cmp',
		version = '1.*',
		opts = {
			keymap = { preset = "enter" },
			completion = {
				list = { selection = { preselect = false } },
				documentation = {
					auto_show = true,
					window = { border = "single" }
				},
				menu = {
					border = "single",
					draw = { gap = 2 }
				},
			},
			sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
			fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	},
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require("lualine").setup()
		end
	}
})
