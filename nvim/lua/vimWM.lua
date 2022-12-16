-- Suckless window-manager like bindings for vim window management

require('utils')

TerminalSpawnBelow = function()
    vim.cmd([[
    :new
    :set norelativenumber
    :set nonumber
    :resize 20
    :terminal
    ]])
end

-- Spawn quick terminal in current directory
map('n', '<M-RETURN>', ':lua TerminalSpawnBelow()<CR>i')

-- Open file manager
map('n', '<M-f>', '<ESC>:Explore!<CR>')

-- Open new tab/windows
map('n', '<M-s>',  '<NOP>')
map('n', '<M-s>v', '<ESC>:vs!<CR>')
map('n', '<M-s>h', '<ESC>:split!<CR>')

map('n', '<M-t>', '<ESC>:tabnew<CR>')

-- Exit terminal with escape
map('t', '<ESC>', '<C-\\><C-n>')

-- Move between windows
map('n', '<M-h>', '<C-w>h')
map('n', '<M-j>', '<C-w>j')
map('n', '<M-k>', '<C-w>k')
map('n', '<M-l>', '<C-w>l')

-- Resize of windows
map('n', '<M-H>', ':vertical resize +2<CR>')
map('n', '<M-J>', ':resize -2<CR>')
map('n', '<M-K>', ':resize +2<CR>')
map('n', '<M-L>', ':vertical resize -2<CR>')

-- Force max tabs to be 9
vim.o.tabpagemax = 9

-- Jump between tabs
map('n', '<M-1>', '1gt')
map('n', '<M-2>', '2gt')
map('n', '<M-3>', '3gt')
map('n', '<M-4>', '4gt')
map('n', '<M-5>', '5gt')
map('n', '<M-6>', '6gt')
map('n', '<M-7>', '7gt')
map('n', '<M-8>', '8gt')
map('n', '<M-9>', '9gt')
