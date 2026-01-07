return  {
	"ibhagwan/fzf-lua",
	opts = {
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
