require('utils')

vim.o.number = true
vim.o.relativenumber = true

map('n', '<LEADER>b', ':!tex<SPACE>%<CR>')
map('n', 'i', 'zzi')
map('n', 'a', 'zza')
map('n', 'o', 'zzo')

setClosingKey('(', ')')
setClosingKey('[', ']')
setClosingKey('{', '}')
setClosingKey('\"', '\"')
setClosingKey('\'', '\'')
setClosingKey('$', '$')

-- Section definitions
EnableGotoJumpMark()
map('i', ';1s', '\\section{}<CR><CR>'..JumpMark..'<ESC>2kf}i')
map('i', ';2s', '\\subsection{}<CR><CR>'..JumpMark..'<ESC>2kf}i')
map('i', ';3s', '\\subsubsection{}<CR><CR>'..JumpMark..'<ESC>2kf}i')
map('i', ';i',  '\\includegraphics[width=0.8\\textwidth]{}<CR>'..JumpMark..'<ESC>1kf}i')
map('i', ';pdf',  '\\includegraphics[page=1,width=0.8\\textwidth]{}<CR>'..JumpMark..'<ESC>1kf}i')
map('i', ';tb', '\\textbf{}<SPACE>'..JumpMark..'<ESC>T{i')
map('i', ';ti', '\\textit{}<SPACE>'..JumpMark..'<ESC>T{i')

local function genListEntries(n)
    local str = '<ESC>' .. n .. 'kA'
    local i = 0
    repeat
        str = str .. '\\item '..JumpMark..'<ENTER>'
        i = i+1
    until (i == n)
    str = str .. '<ESC>' .. n .. 'k0<ESC>' .. JumpMarkGotoBind
    return str
end

map('i', ';ul', '\\begin{itemize}<CR><CR>\\end{itemize}<CR><CR>'..JumpMark..genListEntries(3))
map('i', ';li', '\\begin{enumerate}<CR><CR>\\end{enumerate}<CR><CR>'..JumpMark..genListEntries(3))
map('i', ';ma', '\\begin{equation}<CR><CR>\\end{equation}<CR>'..JumpMark..'<ESC>2ki')
map('i', ';code', '\\begin{verbatim}<CR><CR>\\end{verbatim}<CR>'..JumpMark..'<ESC>2ki')
map('i', ';verb', '\\verb!!<SPACE>'..JumpMark..'<ESC>4hi')
map('i', ';verb', '\\href{}{'..JumpMark..'}<ESC>F{F{a')

-- Math latex
map('i', ':ma', '\\begin{equation}<CR><CR>\\end{equation}<CR>'..JumpMark..'<ESC>2ki')
map('i', ':tb', '\\mathbf{}<SPACE>'..JumpMark..'<ESC>F{i')
map('i', ':ti', '\\mathit{}<SPACE>'..JumpMark..'<ESC>F{i')
map('i', ':bma', '\\begin{bmatrix}<CR><CR>\\end{bmatrix}<CR>'..JumpMark..'<ESC>2ki')
map('i', ':sum', '\\sum_{}^{'..JumpMark..'}<SPACE>'..JumpMark..'<ESC>F}F}i')
map('i', ':int', '\\int_{}^{'..JumpMark..'}<SPACE>d'..JumpMark..'<ESC>F}F}i')
map('i', ':lim', '\\lim_{}<SPACE>'..JumpMark..'<ESC>F}i')
map('i', ':sqr', '\\sqrt_{}<SPACE>'..JumpMark..'<ESC>F}i')

map('i', ':ra', '\\rightarrow')
map('i', ':la', '\\leftarrow')


