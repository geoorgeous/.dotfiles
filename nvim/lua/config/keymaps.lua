vim.g.mapleader = ";"

-- lsp (clangd)
vim.keymap.set({"", "!"}, "<leader>o", ":LspClangdSwitchSourceHeader<CR>", { desc = "Switch between source and header file"})

-- fzf-lua
vim.keymap.set({"", "!"}, "<leader>f", ":FzfLua lgrep_curbuf<CR>", { desc = "String search in current buffer"})
vim.keymap.set({"", "!"}, "<leader><c-f>", ":FzfLua live_grep<CR>", { desc = "String search in project files"})
vim.keymap.set({"", "!"}, "<leader>p", ":FzfLua files<CR>", { desc = "List project file"})
vim.keymap.set({"", "!"}, "<leader><c-p>", ":FzfLua commands<CR>", { desc = "List Nvim commands"})
