--" settings for c related files only

--autocmd Filetype cpp,c,hpp setlocal smartindent
--autocmd FileType cpp,c,hpp setlocal cindent
--autocmd Filetype cpp,c,hpp setlocal colorcolumn=81
--autocmd Filetype cpp,c,hpp noremap <buffer> <LEADER>r <ESC>:!<SPACE>ls<CR>:!<SPACE>./a.out
--autocmd Filetype cpp,c,hpp noremap <buffer> <LEADER>b <ESC>:!<SPACE>ls<CR>:!<SPACE>make clean; make
--
--" Bracket autocompletions
--autocmd Filetype cpp,c,hpp inoremap <buffer> { {}<LEFT>
--autocmd Filetype cpp,c,hpp inoremap <buffer> ( ()<LEFT>
--autocmd Filetype cpp,c,hpp inoremap <buffer> [ []<LEFT>
--autocmd Filetype cpp,c,hpp inoremap <buffer> " ""<LEFT>
--autocmd Filetype cpp,c,hpp inoremap <buffer> ' ''<LEFT>
--autocmd FileType cpp,c,hpp inoremap <buffer> ;com /**/<ESC>hi
--

dofile('./utils.lua')

local c_cpp_types = {"c", "h", "cpp", "hpp"}

if contains(vim.bo.filetype, c_cpp_types) then
    vim.l.rnu = true
    map('i', '(','()')
    map('i', '[','[]')
    map('i', '{','{}')
    map('i', '\"','\"\"')
    map('i', '\'','\'\'')
end
