""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sources for config settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.config/nvim/nvim-config/coc.vim
source $HOME/.config/nvim/monokai.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/autoload/')
    " Buildin LSP support Maybe some other time.
    "Plug 'neovim/nvim-lspconfig'
    "Plug 'nvim-lua/completion-nvim'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    "Plug 'vifm/vifm.vim'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
    "latex
    Plug 'lervag/vimtex'    
    "Intellisence, including LSP(Languange server protocol) autocomplete mm.
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " HTML5 support
    Plug 'mattn/emmet-vim'
    " wm keybindings for 
    Plug 'fabi1cazenave/suckless.vim'  " vim-plug FTW
    "Plug 'fabi1cazenave/termopen.vim'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
" force splits to go down and right
set splitbelow
set splitright
" error messages
set noerrorbells
" tab configuration
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
" navigation
set number
set mouse=a
set cursorline
highlight Cursorline term=NONE cterm=NONE ctermbg=black guibg=Grey40
"indentation
set autoindent " copies the indentation of the previous line
" searching
set smartcase
set ignorecase
set incsearch
" memory management
set noswapfile
" use external backup script on save 
set nobackup
autocmd BufWritePost * !backup <afile>
" create a undo directory
set undodir=~/.nvim/undodir
set undofile
" set clipboard to system clipboard
set clipboard+=unnamedplus
" colorcolumn for line break visual
highlight ColorColumn term=NONE cterm=NONE ctermbg=black guibg=Grey40
" Status line
set statusline=
set statusline+=\ [%M]
set statusline+=\ %F
set statusline+=%= " set commands on right side
set statusline+=\ %l/%L
set statusline+=\ (%p%%)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader
let mapleader=" "
" set custom suckless.vim keybindings
let g:suckless_tmap = 0 
let g:suckless_mappings = {
\    '<M-[df]>'         :   'SetTilingMode("[df]")'         ,
\    '<M-[hjkl]>'       :   'SelectWindow("[hjkl]")'        ,
\    '<M-[HJKL]>'       :   'MoveWindow("[hjkl]")'          ,
\    '<C-M-[hjkl]>'     :   'ResizeWindow("[hjkl]")'        ,
\    '<M-[oO]>'         :   'CreateWindow("[sv]")'          ,
\    '<M-q>'            :   'CloseWindow()'                 ,
\    '<M-[123456789]>'  :   'SelectTab([123456789])'        ,
\    '<M-t>[123456789]' :   'MoveWindowToTab([123456789])'  ,
\    '<M-T>[123456789]' :   'CopyWindowToTab([123456789])'  ,
\}
" override ranger keybindings
let g:ranger_map_keys = 0
let g:user_emmet_install_global = 0
""" leader key to space
nnoremap <SPACE> <Nop>
"" Control splits movement using CTRL hjkl
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
"remap capital hjkl to move 10 characters in their respective direction
"nnoremap H 10hzz
nnoremap J 10jzz
nnoremap K 10kzz
" better word navigation with capitol w being back-one-word
nnoremap W b
" better undo redo by using capital u for redo
nnoremap U <C-r>
" create new line but stay in edit mode
nnoremap O o<ESC>
" the jump to next tag and back commands
nmap <SILENT> gd <Plug>(coc-definition) zz
nmap <SILENT> gb <C-o>zz
" open ranger file manager
nmap <SILENT> <M-n> :call CreateWindow("v")<CR>:Ranger<CR>
map <M-Return> <ESC>:Ranger<CR>
" closing brackets and parantheses
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
" jump to a jump tag denoted by (!)
inoremap <C-SPACE> <ESC>/(!)<CR>da(i
nnoremap <C-SPACE> /(!)<CR>da(i
" search and replace in entire file
nnoremap <LEADER>s :%s///g<Left><Left><Left>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FILETYPE BINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML-CSS
autocmd FileType html,css EmmetInstall
" VIM
autocmd Filetype vim map <LEADER>b <ESC>:source<SPACE>%<CR>
" TEX
" Filetype recognition for latex
let g:tex_flavor = "latex"
autocmd Filetype tex set relativenumber
" the jump to next tag command
" Spell-checking (note ! means to toggle)
autocmd Filetype tex nnoremap <LEADER>r <ESC>:set spell!
" check misspelled word corrections
autocmd Filetype tex nnoremap <LEADER>a z=
autocmd Filetype tex nnoremap <LEADER>b <ESC>:!pdf<SPACE>%<CR>
" closing brackets and parentheses
autocmd FileType tex inoremap $ $$<ESC>i
autocmd Filetype tex inoremap " ""<ESC>i
" go to center of where you want to go to insert mode
autocmd FileType tex nnoremap i zzi
autocmd FileType tex nnoremap a zza
autocmd FileType tex nnoremap o zzo
" auto-completions
autocmd FileType tex inoremap ;bf \textbf{}<SPACE>(!)<ESC>T{i
autocmd FileType tex inoremap ;t \textit{}<SPACE>(!)<ESC>T{i
autocmd FileType tex inoremap ;li \begin{enumerate}<CR><CR>\end{enumerate}<CR><CR>(!)<ESC>3kA\item<SPACE>
autocmd FileType tex inoremap ;ul \begin{itemize}<CR><CR>\end{itemize}<CR><CR>(!)<ESC>3kA\item<SPACE>
autocmd Filetype tex inoremap ;i \includegraphics[width=0.8\textwidth]{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap ;I \includegraphics[width=0.8\textwidth]{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap ;1s \section*{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap ;2s \subsection*{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap ;3s \subsubsection*{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap ;np \newpage<CR><CR>
autocmd Filetype tex inoremap ;ma \[<CR><CR>\]<CR>(!)<ESC>2ki
autocmd Filetype tex inoremap ;code \begin{verbatim}<CR><CR>\end{verbatim}<CR><CR>(!)<ESC>3ki
autocmd Filetype tex inoremap ;verb \verb!!<SPACE>(!)<ESC>4hi
autocmd Filetype tex inoremap ;ref \href{}{(!)}<SPACE>(!)<ESC>F{F{a
"autocmd Filetype tex inoremap ;nl <CR>\newline<CR>
"autocmd Filetype tex inoremap ;ns <CR>\newline<SPACE>\newline<CR>
autocmd Filetype tex inoremap ;e \explanation{}{(!)}<CR><CR>(!)<ESC>2k0f{a
" Math auto-completions
autocmd Filetype tex inoremap :tab \begin{figure}[H]<CR>\begin{tabular}{lll}<CR><CR>\end{tabular}<CR>\end{figure}<ESC>2ki
autocmd Filetype tex inoremap :frac \frac{}{(!)}<SPACE>(!)<ESC>F}F}i
autocmd Filetype tex inoremap :sum \sum_{}^{(!)}<SPACE>(!)<ESC>F}F}i
autocmd Filetype tex inoremap :int \int_{}^{(!)}<SPACE>d(!)<ESC>F}F}i
autocmd Filetype tex inoremap :lim \lim_{}<SPACE>(!)<ESC>F}i
autocmd Filetype tex inoremap :sqr \sqrt{}<SPACE>(!)<ESC>F}i
autocmd Filetype tex inoremap :ma \[<CR><CR>\]<CR>(!)<ESC>2ki
autocmd Filetype tex inoremap :bma \begin{bmatrix}<CR><CR>\end{bmatrix}<CR>(!)<ESC>2ki
autocmd Filetype tex inoremap :leq \leq<SPACE>
autocmd Filetype tex inoremap :geq \geq<SPACE>
autocmd Filetype tex inoremap := \equiv<SPACE>
autocmd Filetype tex inoremap :righta \rightarrow<SPACE>
autocmd Filetype tex inoremap :lefta \leftarrow<SPACE>
" CPP
" settings for c related files only
autocmd Filetype cpp,c,hpp set tabstop=2 softtabstop=2
autocmd Filetype cpp,c,hpp set shiftwidth=2
autocmd Filetype cpp,c,hpp set expandtab
autocmd Filetype cpp,c,hpp set smartindent
autocmd FileType cpp,c,hpp set cindent
autocmd Filetype cpp,c,hpp set colorcolumn=81
autocmd Filetype cpp,c,hpp map <LEADER>r <ESC>:!<SPACE>ls<CR>:!<SPACE>./
autocmd Filetype cpp,c,hpp map <LEADER>b <ESC>:!<SPACE>ls<CR>:!<SPACE>make<SPACE>clean<SPACE>;<SPACE>make<SPACE>
" comment and uncomment commands
autocmd Filetype cpp,c,hpp map <C-k> <ESC>0i//<ESC>$j
autocmd Filetype cpp,c,hpp map <C-u> <ESC>$F/F/2x<ESC>$j
" Jump through coc-errors
"autocmd Filetype cpp,c,hpp nnoremap e <Plug>(coc-diagnostic-prev)
"autocmd Filetype cpp,c,hpp nnoremap E <Plug>(coc-diagnostic-next)
"autocmd FileType cpp,c,hpp set formatoptions=tcql
" autocompletions
autocmd FileType cpp,c,hpp inoremap #i #include<SPACE>
autocmd FileType cpp,c,hpp inoremap #d #define<SPACE>
autocmd Filetype cpp,c,hpp inoremap " ""<ESC>i
autocmd Filetype cpp,c,hpp inoremap ' ''<ESC>i
autocmd FileType cpp,hpp inoremap ;thow throw<SPACE>runtime_error("");<CR>(!)<ESC>k0f"a
autocmd FileType cpp,hpp inoremap ;try try<CR>{<CR><CR>}<CR>catch(<SPACE>runtime_error&<SPACE>e<SPACE>)<CR>{<CR>(!)<CR>}<CR>(!)<ESC>6ki<Tab>
autocmd FileType cpp,hpp inoremap ;for for(){<CR>(!)<CR>}<ESC>2kf)i
autocmd FileType cpp,hpp inoremap ;com /**/<ESC>hi
autocmd FileType cpp,hpp inoremap ;stream osfstream<SPACE>o;<CR>o.open("");<ESC>F"i
autocmd FileType cpp,hpp inoremap ;out std::cout<SPACE><<<SPACE><SPACE><<<SPACE>std::endl;<ESC>F<SPACE>F<SPACE>i
autocmd FileType cpp,hpp inoremap ;class class<SPACE>{<CR>public:<CR>(!)<CR>}<ESC>3kf{i
autocmd FileType cpp,hpp inoremap ;db if(_debug){<CR><CR>}<ESC>kistd::cout<SPACE><<<SPACE>
" PY 
" settings for py related files only
autocmd Filetype py set smartindent
" the jump to next tag command
autocmd Filetype py inoremap " ""<ESC>i
autocmd Filetype py inoremap ' ''<ESC>i
" OTHER
