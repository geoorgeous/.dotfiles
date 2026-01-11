return {
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
}
