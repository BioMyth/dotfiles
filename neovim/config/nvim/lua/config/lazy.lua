local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy if not installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{"Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{out, "WarningMsg" },
			{"\nPress any key to continue without Lazy..."},
		}, true, {})
		vim.fn.getchar()
	end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	--install = { colorscheme = {"evening"}},
	checker = {enabled = true}
})


function prerequire(...)
	local status, lib = pcall(require, ...)
	if(status) then return lib end

	return nil
end


-- Initialize LSP System if available
local mason = prerequire("mason")

if(mason) then
	mason.setup()
else
    vim.api.nvim_echo({
    {"Mason not found"}}, true, {})
end

local lspConfig = prerequire("lspconfig")

if(lspConfig) then
	lspConfig.clangd.setup({})
else
		vim.api.nvim_echo({
			{"LSPConfig not found"},
		}, true, {})
	 
end

--require("mason-lspconfig").clangd.setup{}
