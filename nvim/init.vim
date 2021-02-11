"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SOURCES FOR CONFIG SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.config/nvim/nvim-config/coc.vim"
source $HOME/.config/nvim/monokai.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM PLUGIN MANAGER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/autoload/')
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'francoiscabrol/ranger.vim'
    "latex
    Plug 'lervag/vimtex'    
    "Intellisence, including LSP(Languange server protocol) autocomplete mm.
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " HTML5 support
    Plug 'mattn/emmet-vim'
    " wm keybindings
    Plug 'fabi1cazenave/suckless.vim'
    " PLUGS I DONT USE ANYMORE
    "Plug 'fabi1cazenave/termopen.vim'
    "Plug 'rbgrouleff/bclose.vim'
    "Plug 'vifm/vifm.vim'
    " Buildin LSP support Maybe some other time.
    "Plug 'neovim/nvim-lspconfig'
    "Plug 'nvim-lua/completion-nvim'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
" file encoding
set encoding=utf-8
" keeps buffers open
set hidden
" force splits to go down and right
set splitbelow
set splitright
" force scroll when X lines away from border
set scrolloff=8
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
"set nohlsearch
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (blank)   Disaples status commands created by plugins 
" M         Unsaved modifications
" <         where to truncate status line if it is too long
" F         total path to file in buffer
" =         allign to right side
" l/L       current line / total lines
" c         current column
" p         current line in percentage
set statusline=
set statusline+=\ [%M]
set statusline+=\ %<
set statusline+=\ %F
set statusline+=\ %=
set statusline+=\ %l/%L
set statusline+=\ ,%c
set statusline+=\ (%p%%)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader
let mapleader=" "
" remove normal space behavior in favor of leader behavior
nnoremap <SPACE> <Nop>
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
" open ranger file manager
noremap <M-n> <ESC>:call CreateWindow("v")<CR>:Ranger<CR>
noremap <LEADER>f <ESC>:Ranger<CR>
noremap <M-RETURN> <ESC>:call CreateWindow("s")<CR>:terminal<CR>i
" close terminal with escape
tnoremap <ESC> <C-\><C-n>
" easier movement of large files
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k
" better word navigation with capitol w being back-one-word
nnoremap W b
vnoremap W b
" better undo redo by using capital u for redo
nnoremap U <C-r>
" create new line but stay in edit mode
nnoremap O o<ESC>
" the jump to next tag and back commands
nnoremap <SILENT> gd <Plug>(coc-definition) zz
nnoremap <SILENT> gb <C-o>zz
" closing brackets and parantheses
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
" jump to a jump tag denoted by (!)
inoremap <C-SPACE> <ESC>/(!)<CR>da(i
nnoremap <C-SPACE> /(!)<CR>da(i
" search and replace in entire file
nnoremap <LEADER>s :%s///g<Left><Left><Left>
" Force hjkl bindings
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
" stop command history from showing
noremap q: :q
" indent and outdent with tab (note it an be combined with amount like (4<TAB>))
vnoremap <TAB> >><ESC>gv
vnoremap <S-TAB> <<<ESC>gv
nnoremap <TAB> >><ESC>
nnoremap <S-TAB> <<<ESC>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLD SETTINGS AND BINDINGS (testing)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make sure to save and load views on enter leave
"autocmd BufWinLeave ?* mkview 1
"autocmd BufWinEnter ?* silent! loadview 1
" save only fold and cursor info
"let &viewoptions="folds,cursor,unix"
"set viewdir=~/.nvim/viewdir
" vim fold bindings
"set foldmethod=manual
"autocmd InsertLeave,WinEnter * setlocal foldmethod=marker
"autocmd InsertEnter,WinLeave * setlocal foldmethod=manual
"set foldmethod=marker
"set foldnestmax=3
"nnoremap za :setlocal<SPACE>foldmethod=marker<CR>za:setlocal<SPACE>foldmethod=manual<CR>zz
"autocmd FileType tex inoremap ;{{ %{{{FOLD
"autocmd FileType tex inoremap ;}} %}}}FOLD
"autocmd FileType tex nnoremap za :set<SPACE>foldmethod=marker<CR>:set<SPACE>foldmarker={{{FOLD,}}}FOLD<CR>za:set<SPACE>foldmethod=manual<CR>zz
"autocmd FileType vim inoremap ;{{ "{{{
"autocmd FileType vim inoremap ;}} "}}}
"autocmd FileType cpp,c,hpp inoremap ;{{ /*{{{*/<ESC>hi
"autocmd FileType cpp,c,hpp inoremap ;}} /*}}}*/
"autocmd FileType html inoremap ;{{ <!--{{{--><ESC>2hi
"autocmd FileType html inoremap ;}} <!--}}}-->
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE BINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML-CSS
autocmd FileType html,css EmmetInstall
" VIM
autocmd Filetype vim noremap <buffer> <LEADER>b <ESC>:source<SPACE>~/.config/nvim/init.vim<CR>
" TEX
" Filetype recognition for latex
let g:tex_flavor = "latex"
autocmd Filetype tex setlocal relativenumber
" the jump to next tag command
" Spell-checking (note ! means to toggle)
autocmd Filetype tex nnoremap <buffer> <F1> :set spell!<CR>
" check misspelled word corrections
autocmd Filetype tex nnoremap <buffer> <LEADER>a z=
" convert tex document to pdf
autocmd Filetype tex nnoremap <buffer> <LEADER>b <ESC>:!pdf<SPACE>%<CR>
" closing brackets and parentheses
autocmd FileType tex inoremap <buffer> $ $$<ESC>i
autocmd Filetype tex inoremap <buffer> " ""<ESC>i
" go to center of where you want to go to insert mode
autocmd FileType tex nnoremap <buffer> i zzi
autocmd FileType tex nnoremap <buffer> a zza
autocmd FileType tex nnoremap <buffer> o zzo
" auto-completions
autocmd FileType tex inoremap <buffer> ;bf \textbf{}<SPACE>(!)<ESC>T{i
autocmd FileType tex inoremap <buffer> ;t  \textit{}<SPACE>(!)<ESC>T{i
autocmd FileType tex inoremap <buffer> ;li \begin{enumerate}<CR><CR>\end{enumerate}<CR><CR>(!)<ESC>3kA\item<SPACE>
autocmd FileType tex inoremap <buffer> ;ul \begin{itemize}<CR><CR>\end{itemize}<CR><CR>(!)<ESC>3kA\item<SPACE>
autocmd Filetype tex inoremap <buffer> ;i \includegraphics[width=0.8\textwidth]{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap <buffer> ;I \includegraphics[width=0.8\textwidth]{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap <buffer> ;1s \section*{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap <buffer> ;2s \subsection*{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap <buffer> ;3s \subsubsection*{}<CR><CR>(!)<ESC>2kf}i
autocmd Filetype tex inoremap <buffer> ;np \newpage<CR><CR>
autocmd Filetype tex inoremap <buffer> ;ma \[<CR><CR>\]<CR>(!)<ESC>2ki
autocmd Filetype tex inoremap <buffer> ;code \begin{verbatim}<CR><CR>\end{verbatim}<CR><CR>(!)<ESC>3ki
autocmd Filetype tex inoremap <buffer> ;verb \verb!!<SPACE>(!)<ESC>4hi
autocmd Filetype tex inoremap <buffer> ;ref \href{}{(!)}<SPACE>(!)<ESC>F{F{a
autocmd Filetype tex inoremap <buffer> ;e \explanation{}{(!)}<CR><CR>(!)<ESC>2k0f{a
"autocmd Filetype tex inoremap <buffer> ;nl <CR>\newline<CR>
"autocmd Filetype tex inoremap <buffer> ;ns <CR>\newline<SPACE>\newline<CR>
" Math auto-completions
autocmd Filetype tex inoremap <buffer> :tab \begin{figure}[H]<CR>\begin{tabular}{lll}<CR><CR>\end{tabular}<CR>\end{figure}<ESC>2ki
autocmd Filetype tex inoremap <buffer> :frac \frac{}{(!)}<SPACE>(!)<ESC>F}F}i
autocmd Filetype tex inoremap <buffer> :sum \sum_{}^{(!)}<SPACE>(!)<ESC>F}F}i
autocmd Filetype tex inoremap <buffer> :int \int_{}^{(!)}<SPACE>d(!)<ESC>F}F}i
autocmd Filetype tex inoremap <buffer> :lim \lim_{}<SPACE>(!)<ESC>F}i
autocmd Filetype tex inoremap <buffer> :sqr \sqrt{}<SPACE>(!)<ESC>F}i
autocmd Filetype tex inoremap <buffer> :ma \[<CR><CR>\]<CR>(!)<ESC>2ki
autocmd Filetype tex inoremap <buffer> :bma \begin{bmatrix}<CR><CR>\end{bmatrix}<CR>(!)<ESC>2ki
autocmd Filetype tex inoremap <buffer> :leq \leq<SPACE>
autocmd Filetype tex inoremap <buffer> :geq \geq<SPACE>
autocmd Filetype tex inoremap <buffer> := \equiv<SPACE>
autocmd Filetype tex inoremap <buffer> :righta \rightarrow<SPACE>
autocmd Filetype tex inoremap <buffer> :lefta \leftarrow<SPACE>
" Beamer presentations
autocmd Filetype tex inoremap <buffer> __f \begin{frame}<CR>\frametitle{}<CR>(!)<CR>\end{frame}<CR><CR>(!)<ESC>4kf{a
autocmd Filetype tex inoremap <buffer> __p \pause
autocmd Filetype tex inoremap <buffer> __c \begin{columns}<CR>\column{.4\textwidth}<CR><CR>\column{.6\textwidth}<CR>(!)<CR>\end{columns}<ESC>3ki
autocmd Filetype tex inoremap <buffer> __i \includegraphics[width=1\textwidth]{}<CR>(!)<ESC>kf{a

" CPP
" settings for c related files only
autocmd Filetype cpp,c,hpp setlocal tabstop=2 softtabstop=2
autocmd Filetype cpp,c,hpp setlocal shiftwidth=2
autocmd Filetype cpp,c,hpp setlocal expandtab
autocmd Filetype cpp,c,hpp setlocal smartindent
autocmd FileType cpp,c,hpp setlocal cindent
autocmd Filetype cpp,c,hpp setlocal colorcolumn=81
autocmd Filetype cpp,c,hpp noremap <buffer> <LEADER>r <ESC>:!<SPACE>ls<CR>:!<SPACE>./
autocmd Filetype cpp,c,hpp noremap <buffer> <LEADER>b <ESC>:!<SPACE>ls<CR>:!<SPACE>make<SPACE>clean<SPACE>;<SPACE>make<SPACE>
" comment and uncomment commands
autocmd Filetype cpp,c,hpp noremap <buffer> <C-k> <ESC>0i//<ESC>$j
autocmd Filetype cpp,c,hpp noremap <buffer> <C-u> <ESC>$F/F/2x<ESC>$j
" Jump through coc-errors
"autocmd Filetype cpp,c,hpp nnoremap <buffer> e <Plug>(coc-diagnostic-prev)
"autocmd Filetype cpp,c,hpp nnoremap <buffer> E <Plug>(coc-diagnostic-next)
"autocmd FileType cpp,c,hpp set formatoptions=tcql
" autocompletions
"autocmd FileType cpp,c,hpp abbreviate #inc #include<SPACE>
"autocmd FileType cpp,c,hpp abbreviate #def #define<SPACE>
autocmd FileType cpp,c,hpp inoremap <buffer> #i #include<SPACE>
autocmd FileType cpp,c,hpp inoremap <buffer> #d #define<SPACE>
autocmd Filetype cpp,c,hpp inoremap <buffer> " ""<ESC>i
autocmd Filetype cpp,c,hpp inoremap <buffer> ' ''<ESC>i
autocmd FileType cpp,hpp inoremap <buffer> ;thow throw<SPACE>runtime_error("");<CR>(!)<ESC>k0f"a
autocmd FileType cpp,hpp inoremap <buffer> ;try try<CR>{<CR><CR>}<CR>catch(<SPACE>runtime_error&<SPACE>e<SPACE>)<CR>{<CR>(!)<CR>}<CR>(!)<ESC>6ki<Tab>
autocmd FileType cpp,hpp inoremap <buffer> ;for for(){<CR>(!)<CR>}<ESC>2kf)i
autocmd FileType cpp,hpp inoremap <buffer> ;com /**/<ESC>hi
autocmd FileType cpp,hpp inoremap <buffer> ;stream osfstream<SPACE>o;<CR>o.open("");<ESC>F"i
autocmd FileType cpp,hpp inoremap <buffer> ;out std::cout<SPACE><<<SPACE><SPACE><<<SPACE>std::endl;<ESC>F<SPACE>F<SPACE>i
autocmd FileType cpp,hpp inoremap <buffer> ;class class<SPACE>{<CR>public:<CR>(!)<CR>}<ESC>3kf{i
autocmd FileType cpp,hpp inoremap <buffer> ;db if(_debug){<CR><CR>}<ESC>kistd::cout<SPACE><<<SPACE>
" PY 
" settings for py related files only
autocmd Filetype py set smartindent
" the jump to next tag command
autocmd Filetype py inoremap <buffer> " ""<ESC>i
autocmd Filetype py inoremap <buffer> ' ''<ESC>i
