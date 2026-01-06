return {
	"neanias/everforest-nvim",
	config = function()
		require("everforest").setup({
			transparent_background_level = 1
		})
		vim.cmd.colorscheme("everforest")
	end
}
