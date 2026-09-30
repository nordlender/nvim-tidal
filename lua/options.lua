require "nvchad.options"

local o = vim.o

o.cursorlineopt ='both' -- to enable cursorline!
o.showtabline = 2

o.cursorline = true
o.cursorlineopt ='both' -- to enable cursorline!
o.number = true
o.relativenumber = true
o.conceallevel = 2 -- SET ME
o.showbreak = "> "

o.expandtab = false -- look up
o.tabstop = 2
o.shiftwidth = 2
o.shiftround = true
-- o.cindent 
-- o.smartindent
o.autoindent = true
o.copyindent = true
o.preserveindent = false -- set?

o.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
