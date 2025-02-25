-- Helper Functions
--
local function defaultValue(value, default)
    if (value == nil or value == '') then
        return default
    end
    return value
end

local colorscheme = "evening"


local indent = 4

local configDir = defaultValue(os.getenv("XDG_CACHE_HOME"), os.getenv("HOME") .. "/.cache/")
local dataDir = configDir .. "nvim/"

--vim.cmd("colorscheme " .. colorscheme)

vim.opt.backupdir = dataDir .. "backups"
vim.opt.directory = dataDir .. "swapfiles"

vim.opt.undofile = true
vim.opt.undodir = dataDir .. "undofiles"

vim.opt.modelines = 0

vim.opt.expandtab = true
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.tabstop = indent


vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.hidden = true
vim.opt.laststatus = 2
vim.opt.scrolloff = 3
vim.opt.showmode = true
vim.opt.visualbell = true
vim.opt.wildmode = "list:longest"
-- Line Numbers
vim.opt.number = true
-- Don't wrap lines
vim.opt.wrap = false

-- Ignore search case
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.showmatch = true

vim.opt.list = true
--vim.opt.listchars = "tab:>-,eol:$,space:_"
vim.opt.listchars = "tab:>-"

