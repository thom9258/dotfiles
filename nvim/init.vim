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
call plug#end()
" override ranger keybindings
let g:ranger_map_keys = 0
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" leader key to space
syntax on
let mapleader=" "
nnoremap <Space> <Nop>
"nnoremap <Left> <Nop>
"nnoremap <Right> <Nop>
"nnoremap <Up> <Nop>
"nnoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"" Control splits movement using CTRL hjkl
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
"remap capital hjkl to move 10 characters in their respective direction
"nnoremap H 10hzz
nnoremap J 10jzz
nnoremap K 10kzz
"nnoremap L 10lzz
" better word navigation with capitol w being back one word
nnoremap W b
" better undo redo by using capital u for redo
nnoremap U <C-r>
" create new line but stay in edit mode
nnoremap O o<Esc>
"Open terminal
nnoremap <leader>t <Esc>:!<space>ls<Cr>:!<space>
" the jump to next tag and back commands
nmap <silent> gd <Plug>(coc-definition) zz
nmap <silent> gb <C-o>zz
" open ranger file manager
map <leader>f <Esc>:Ranger<CR>
map <leader>n <Esc>:vsplit<Cr>:Ranger<Cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set regexpengine=1
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
"set nobackup
" use external backup script on save 
autocmd BufWritePost * !backup <afile>
"
"Meaningful backup name, ex: filename@2015-04-05.14:59 USE THIS ONE IF YOU
"DONT HAVE A BACKUP DIRECTORY
"au BufWritePre * let &bex = '@' . strftime("%F.%H:%M") 
"set backup
"set backupdir=~/.nvim/backupdir//
"set writebackup
"set backupcopy=yes
"
" create a undo directory
set undodir=~/.nvim/undodir
set undofile
" set clipboard to system clipboard
set clipboard+=unnamedplus
" colorcolumn for line break visual
highlight ColorColumn term=NONE cterm=NONE ctermbg=black guibg=Grey40
" split control
set splitbelow
set splitright
" Status line
set statusline=
set statusline+=\ [%M]
set statusline+=\ %f
set statusline+=%= " set commands on right side
set statusline+=\ %l/%L
set statusline+=\ (%p%%)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FILETYPE SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALL
" closing brackets and parantheses
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap <C-Space> <Esc>/(!)<Cr>da(i
nnoremap <C-Space> /(!)<Cr>da(i
map <leader>s <Esc>:%s/
nnoremap <Leader>s :%s///g<Left><Left><Left>
" VIM
autocmd Filetype vim map <leader>b <Esc>:source<Space>%
" Relative numbers for testing
" TEX
" Filetype recocnition for latex
let g:tex_flavor = "latex"
autocmd Filetype tex set relativenumber
" the jump to next tag command
" Spellchecking (note the ! means to toggle)
autocmd Filetype tex nnoremap <leader>r <Esc>:set spell!
" check misspelled word corrections
autocmd Filetype tex nnoremap <leader>t z=
autocmd Filetype tex nnoremap <leader>b <Esc>:!pdf<Space>%<Cr>
" closing brackets and parantheses
autocmd FileType tex inoremap $ $$<Esc>i
autocmd Filetype tex inoremap " ""<Esc>i
" go to center of where you want to go to insert mode
autocmd FileType tex nnoremap i zzi
autocmd FileType tex nnoremap a zza
autocmd FileType tex nnoremap o zzo
" autocompletions
autocmd FileType tex inoremap ;bf \textbf{}<Space>(!)<Esc>T{i
autocmd FileType tex inoremap ;t \textit{}<Space>(!)<Esc>T{i
autocmd FileType tex inoremap ;li \begin{enumerate}<Cr><Cr>\end{enumerate}<Cr><Cr>(!)<Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Cr><Cr>\end{itemize}<Cr><Cr>(!)<Esc>3kA\item<Space>
autocmd Filetype tex inoremap ;i \includegraphics[width=0.8\textwidth]{}<Cr><Cr>(!)<Esc>2kf}i
autocmd Filetype tex inoremap ;I \includegraphics[width=0.8\textwidth]{}<Cr><Cr>(!)<Esc>2kf}i
autocmd Filetype tex inoremap ;1s \section*{}<Cr><Cr>(!)<Esc>2kf}i
autocmd Filetype tex inoremap ;2s \subsection*{}<Cr><Cr>(!)<Esc>2kf}i
autocmd Filetype tex inoremap ;3s \subsubsection*{}<Cr><Cr>(!)<Esc>2kf}i
autocmd Filetype tex inoremap ;np \newpage<Cr><Cr>
autocmd Filetype tex inoremap ;ma \[<Cr><Cr>\]<Cr>(!)<Esc>2ki
autocmd Filetype tex inoremap ;code \begin{verbatim}<Cr><Cr>\end{verbatim}<Cr><Cr>(!)<Esc>3ki
autocmd Filetype tex inoremap ;verb \verb!!<Space>(!)<Esc>4hi
autocmd Filetype tex inoremap ;ref \href{}{(!)}<Space>(!)<Esc>F{F{a
"autocmd Filetype tex inoremap ;nl <Cr>\newline<Cr>
"autocmd Filetype tex inoremap ;ns <Cr>\newline<Space>\newline<Cr>
autocmd Filetype tex inoremap ;e \explanation{}{(!)}<Cr><Cr>(!)<Esc>2k0f{a
" Math note that math uses the colon : prefix and normal latex uses the semi
" colon ; prefix
autocmd Filetype tex inoremap :tab \begin{figure}[H]<Cr>\begin{tabular}{lll}<Cr><Cr>\end{tabular}<Cr>\end{figure}<Esc>2ki
autocmd Filetype tex inoremap :frac \frac{}{(!)}<Space>(!)<Esc>F}F}i
autocmd Filetype tex inoremap :sum \sum_{}^{(!)}<Space>(!)<Esc>F}F}i
autocmd Filetype tex inoremap :int \int_{}^{(!)}<Space>d(!)<Esc>F}F}i
autocmd Filetype tex inoremap :lim \lim_{}<Space>(!)<Esc>F}i
autocmd Filetype tex inoremap :sqr \sqrt{}<Space>(!)<Esc>F}i
autocmd Filetype tex inoremap :ma \[<Cr><Cr>\]<Cr>(!)<Esc>2ki
autocmd Filetype tex inoremap :bma \begin{bmatrix}<Cr><Cr>\end{bmatrix}<Cr>(!)<Esc>2ki
autocmd Filetype tex inoremap :leq \leq<Space>
autocmd Filetype tex inoremap :geq \geq<Space>
autocmd Filetype tex inoremap := \equiv<Space>
autocmd Filetype tex inoremap :righta \rightarrow<Space>
autocmd Filetype tex inoremap :lefta \leftarrow<Space>
" CPP
" settings for c related files only
autocmd Filetype cpp,c,hpp set tabstop=2 softtabstop=2
autocmd Filetype cpp,c,hpp set shiftwidth=2
autocmd Filetype cpp,c,hpp set expandtab
autocmd Filetype cpp,c,hpp set smartindent
autocmd FileType cpp,c,hpp set cindent
autocmd Filetype cpp,c,hpp set colorcolumn=81
autocmd Filetype cpp,c,hpp map <leader>r <Esc>:!<space>ls<Cr>:!<space>./
autocmd Filetype cpp,c,hpp map <leader>b <Esc>:!<space>ls<Cr>:!<space>make<Space>clean<Space>;<Space>make<Space>
" comment and uncomment commands
autocmd Filetype cpp,c,hpp map <C-k> <Esc>0i//<Esc>$j
autocmd Filetype cpp,c,hpp map <C-u> <Esc>$F/F/2x<Esc>$j
" Jump through coc-errors
"autocmd Filetype cpp,c,hpp nnoremap e <Plug>(coc-diagnostic-prev)
"autocmd Filetype cpp,c,hpp nnoremap E <Plug>(coc-diagnostic-next)
"autocmd FileType cpp,c,hpp set formatoptions=tcql
" autocompletions
autocmd FileType cpp,c,hpp inoremap #i #include<Space>
autocmd FileType cpp,c,hpp inoremap #d #define<Space>
autocmd Filetype cpp,c,hpp inoremap " ""<Esc>i
autocmd Filetype cpp,c,hpp inoremap ' ''<Esc>i
autocmd FileType cpp,hpp inoremap ;thow throw<space>runtime_error("");<Cr>(!)<Esc>k0f"a
autocmd FileType cpp,hpp inoremap ;try try<Cr>{<Cr><Cr>}<Cr>catch(<Space>runtime_error&<Space>e<Space>)<Cr>{<Cr>(!)<Cr>}<Cr>(!)<Esc>6ki<Tab>
autocmd FileType cpp,hpp inoremap ;for for(){<Cr>(!)<Cr>}<Esc>2kf)i
autocmd FileType cpp,hpp inoremap ;com /**/<Esc>hi
autocmd FileType cpp,hpp inoremap ;stream osfstream<Space>o;<Cr>o.open("");<Esc>F"i
autocmd FileType cpp,hpp inoremap ;out std::cout<Space><<<Space><Space><<<Space>std::endl;<Esc>F<Space>F<Space>i
autocmd FileType cpp,hpp inoremap ;class class<Space>{<Cr>public:<Cr>(!)<Cr>}<Esc>3kf{i
autocmd FileType cpp,hpp inoremap ;db if(_debug){<Cr><Cr>}<Esc>kistd::cout<Space><<<Space>
" PY 
" settings for py related files only
autocmd Filetype py set smartindent
" the jump to next tag command
autocmd Filetype py inoremap " ""<Esc>i
autocmd Filetype py inoremap ' ''<Esc>i
" OTHER
