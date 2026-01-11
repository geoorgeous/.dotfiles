return  {
	"ibhagwan/fzf-lua",
	opts = {
		winopts = {
			height = 0.85,
			width = 0.85,
			preview = {
				horizontal = "right:75%"
			}
		},
		previewers = {
			git_diff = {
				cmd_modified = "git diff --color --ignore-space-at-eol HEAD"
			}
		},
		files = {
			git_icons = true
		}
	}
}
