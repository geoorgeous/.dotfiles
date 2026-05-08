vim.ui.open = function(path)
  vim.fn.jobstart({ "gio", "open", path }, {
	  cwd = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h"),
	  detach = true
  })
end
