-- Utilities for nvim config

function map(m, k, v)
    vim.keymap.set(m, k, v, {silent = true})
end

function contains(k, l)
    for v in l do
        if v == k then
            return true
        end
    end
    return false
end

function setClosingKey(open, close)
    map('i', open, open .. close ..'<ESC>i')
end

JumpMark = '(!)'
JumpMarkGotoBind = '<C-SPACE>'
function EnableGotoJumpMark()
    map('i', JumpMarkGotoBind, '<ESC>/'..JumpMark..'<CR>"_da(i')
    map('n', JumpMarkGotoBind, '/'..JumpMark..'<CR>"_da(i')
end
