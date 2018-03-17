set nocompatible
set term=xterm-256color
set laststatus=2
set nowrap
set nofoldenable
set number
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
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
set textwidth=80
set colorcolumn=81
set backupcopy=yes

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hail2u/vim-css3-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'

call plug#end()

" Airline
let g:airline_solarized_bg='dark'
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts=1

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|git'

" JSX
let g:jsx_ext_required = 0

" Nerdtree
let g:NERDTreeShowHidden=1
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
    autocmd FileType css :call SetCssCheckers()
endif

