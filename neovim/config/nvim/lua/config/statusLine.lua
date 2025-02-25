
local statusLine = ""
-- Bold
statusLine = statusLine .. "%#keyword#"
-- Get filepath
statusLine = statusLine .. "%F"
-- Normal text
statusLine = statusLine .. "%#string#"
-- Get file encoding
statusLine = statusLine .. " [%{strlen(&fenc)?&fenc:'none'},"
-- Get File Format
statusLine = statusLine .. "%{&ff}]"
-- Help file flag
statusLine = statusLine .. "%h"
-- TBD
statusLine = statusLine .. "%#error#"
-- Read Only Flag
statusLine = statusLine .. "%r"
statusLine = statusLine .. "%#string#"
-- Modified Flag
statusLine = statusLine .. "%m"
-- File type/language flag
statusLine = statusLine .. "%y"
statusLine = statusLine .. "%#string#"
-- Left Right Seperator
statusLine = statusLine .. "%="

statusLine = statusLine .. "%#keyword#"
statusLine = statusLine .. "\u{E0B2}"
statusLine = statusLine .. "%#class#"

-- Cursor character
statusLine = statusLine .. "%c:"
-- Cursor line / total lines
statusLine = statusLine .. "%l/%L"

--statusLine = statusLine .. 
vim.opt.statusline = statusLine
