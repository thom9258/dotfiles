-- General settings for vim
local g = vim.g
local o = vim.o

-- Leader
g.mapleader = ' '

-- keeps buffers open
o.hidden = true

-- force splits to go down and right
o.splitbelow = true
o.splitright = true

-- force scroll when X lines away from border
o.scrolloff = 8

-- error messages
o.errorbells = false

-- tab configuration
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- navigation
o.mouse = 'a'
o.cursorline = true

--highlight Cursorline term=NONE cterm=NONE ctermbg=black guibg=Grey40
--indentation copies the indentation of the previous line
o.autoindent = true

-- searching
o.smartcase = true
o.ignorecase = true
o.incsearch = true

--set nohlsearch
-- colorcolumn for line break visual
--highlight ColorColumn term=NONE cterm=NONE ctermbg=black guibg=Grey40
-- spelling dictionalies path
--let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

-- Memory management
o.swapfile = false

-- use external backup script on save 
o.backup = false
--TODO: Integrate backup script
--autocmd BufWritePost * !backup <afile>
-- create a undo directory

o.undofile = true
--o.undodir = '$HOME/.config/nvim/undodir'

o.clipboard = 'unnamedplus'
