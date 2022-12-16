package.path = package.path .. '/home/th/.config/nvim/'

require('plugins')
require('settings')
require('vimWM')
--require('c_cpp')

--require('latex')
--require('c_cpp')

-- Load Colorscheme
vim.cmd('colorscheme gruvbox')
