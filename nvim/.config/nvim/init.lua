local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"neovim/nvim-lspconfig",
})

require("lspconfig").zls.setup{}

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.keymap.set('n', '<C-Space>', vim.lsp.buf.hover, { buffer = args.buf })
		vim.keymap.set('i', '<C-Space>', vim.lsp.omnifunc, { buffer = args.buf })
		vim.keymap.set('i', '.', '.<C-X><C-O>', { buffer = args.buf })
	end,
})

vim.opt.completeopt = "menu,preview,menuone,noselect"
vim.api.nvim_create_autocmd('InsertLeave,CompleteDone *', {
	callback = function(args)
		if vim.fn.pumvisible() == 0 then
			vim.cmd([[pclose]])
		end
	end,
})

vim.opt.shell = '/usr/bin/env bash'
