local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy if not installed
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local pluginsToLoad = {
	-- Include LSP as basic plugins
	"williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
}
--{}

-- Load AdditionalPlugins directory automatically


local additionalPluginFolder = "lua/additionalPlugins/"
local additionalPluginsPath = vim.fn.stdpath("config") .. "/" .. additionalPluginFolder

local additionalPlugins = vim.fn.split(vim.fn.globpath(additionalPluginsPath, "*.lua"), "\n")


for index, pluginPath in pairs(additionalPlugins) do
	local pluginModule = pluginPath:match'.*/(.*).lua'

	local plugins = require("additionalPlugins/" .. pluginModule)--require(additionalPluginFolder .. pluginModule)

	table.insert(pluginsToLoad, plugins)
end


function prerequire(...)
	local status, lib = pcall(require, ...)
	if(status) then return lib end

	return nil
end

require("lazy").setup(
	pluginsToLoad
)


-- Initialize LSP System if available
local mason = prerequire("mason")

if(mason) then
	mason.setup()
end
