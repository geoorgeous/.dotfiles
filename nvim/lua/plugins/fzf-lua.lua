local files = {
	git_icons = true,
	rg_opts = "--sort=path --color=never --files --hidden --follow -g '!.git'",
	cwd = vim.fn.expand "%:p:h"
}

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
		files = files
	},
	config = function()
		local fzf_lua = require('fzf-lua')
		local loaded_buffs = {}

		-- Open fzf in the directory when opening a directory buffer
		vim.api.nvim_create_autocmd('BufEnter', {
			pattern = "*",
			callback = function(args)
				-- If netrw is enabled just keep it, but it should be disabled
				if vim.bo[args.buf].filetype == "netrw" then
					return
				end

				-- Get buffer name and check if it's a directory
				local bufname = vim.api.nvim_buf_get_name(args.buf)
				if vim.fn.isdirectory(bufname) == 0 then
					return
				end

				-- Prevent reopening the explorer after it's been closed
				if loaded_buffs[bufname] then
					return
				end
				loaded_buffs[bufname] = true

				-- Do not list directory buffer and wipe it on leave
				vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = args.buf })
				vim.api.nvim_set_option_value("buflisted", false, { buf = args.buf })

				-- Open fzf in the directory
				vim.schedule(function() fzf_lua.files(files) end)
			end
		})

		-- This makes sure that the explorer will open again after opening same buffer again
		vim.api.nvim_create_autocmd('BufLeave', {
			pattern = "*",
			callback = function(args)
				local bufname = vim.api.nvim_buf_get_name(args.buf)
				if vim.fn.isdirectory(bufname) == 0 then
					return
				end
				loaded_buffs[bufname] = nil
			end
		})
	end
}
