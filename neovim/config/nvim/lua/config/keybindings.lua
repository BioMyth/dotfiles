local function map(mode, combo, mapping, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- Allow ctrl x to act as insert
map("i", "<C-x>", "<Esc>")

-- Allow for 1-9 in normal mode to change tabs
map("n", "1", ":b1<CR>")
map("n", "2", ":b2<CR>")
map("n", "3", ":b3<CR>")
map("n", "4", ":b4<CR>")
map("n", "5", ":b5<CR>")
map("n", "6", ":b6<CR>")
map("n", "7", ":b7<CR>")
map("n", "8", ":b8<CR>")
map("n", "9", ":b9<CR>")

map("", "<a-1>", ":tabn 1<CR>")
map("", "<a-2>", ":tabn 2<CR>")
map("", "<a-3>", ":tabn 3<CR>")
map("", "<a-4>", ":tabn 4<CR>")
map("", "<a-5>", ":tabn 5<CR>")
map("", "<a-6>", ":tabn 6<CR>")
map("", "<a-7>", ":tabn 7<CR>")
map("", "<a-8>", ":tabn 8<CR>")
map("", "<a-9>", ":tabn 9<CR>")


-- Allow ctrl backspace in edit mode to delete word
map("i", "<C-BS>", "<C-W>")

-- Allow for ctrl + keys to skip a word in other modes
map("", "<a-w>", "<c-w>")
map("", "<a-l>", "<c-w>l")
map("", "<a-k>", "<c-w>k")
map("", "<a-j>", "<c-w>j")
map("", "<a-h>", "<c-w>h")


-- Allow for ctrl + keys to skip a word in insert mode
map("i", "<a-l>", "<esc><c-w>li")
map("i", "<a-k>", "<esc><c-w>ki")
map("i", "<a-j>", "<esc><c-w>ji")
map("i", "<a-h>", "<esc><c-w>hi")

-- Disable arrow keys
--[[
map("", "<Up>", "<c-w>k")
map("", "<Down>", "<c-w>j")
map("", "<Left>", "<c-w>h")
map("", "<Right>", "<c-w>l")
]]--
map("", "<Esc>", "<C-\\><C-n")
