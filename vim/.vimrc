set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set term=xterm-256color
set laststatus=2
set nowrap
set nofoldenable
set number
set noshowmode
set title
set novisualbell
set shortmess=atI
set nostartofline
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=4
"set textwidth=80
"set colorcolumn=81
set backupcopy=yes

filetype plugin indent on


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mxw/vim-jsx'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'gregsexton/MatchTag'
Plugin 'alvan/vim-closetag'
Plugin 'pangloss/vim-javascript'
Plugin 'junegunn/goyo.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'styled-components/vim-styled-components'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Airline
let g:airline_solarized_bg='dark'
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts=1

" Closetag
let g:closetag_filenames = '*.hbs,*.html, *.js'

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|git'

" jsx
let g:jsx_ext_required = 0

" Nerdtree
map <F2> :NERDTree<CR>
map <F3> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {
    \'mode': 'active',
    \'active_filetypes': [],
    \'passive_filetypes': ['html'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_check_on_open = 1

fun! SetJavascriptCheckers()
    let localEslint = findfile('node_modules/.bin/eslint', '.;')
    if localEslint != ''
        let b:syntastic_javascript_eslint_exec = fnamemodify(localEslint, ':p')
    endif
endf

fun! SetCssCheckers()
    let localStylelint = findfile('node_modules/.bin/stylelint', '.;')
    if localStylelint != ''
        let b:syntastic_css_stylelint_exec = fnamemodify(localStylelint, ':p')
    endif
endf    

if !exists('autocommands_loaded')
    let autocommands_loaded = 1
    autocmd FileType javascript :call SetJavascriptCheckers()
    autocmd FileType scss :call SetCssCheckers()
endif    
