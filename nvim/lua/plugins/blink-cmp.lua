return {
	"saghen/blink.cmp",
	dependencies = { "xzbdmw/colorful-menu.nvim" },
	version = '1.*',
	opts = {
		keymap = { preset = "enter" },
		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = false
				}
			},
			documentation = {
				auto_show = true,
				window = { border = "rounded" }
			},
			menu = {
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
					columns = { { "kind_icon", "label" } },
					-- integrate colorful-menu.nvim with blink.cmp
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
					align_to = "cursor"
				},
			},
			ghost_text = { enabled = true }
		},
		signature = {
			enabled = true,
			show_on_insert_on_trigger_character = false,
			show_on_trigger_character = false,
			show_on_insert = false
		}
	},
}
