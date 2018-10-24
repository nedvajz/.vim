" {{{ Vundle and basic settings

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'einars/js-beautify'
"Plugin 'joonty/vim-phpqa.git'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'rking/ag.vim.git'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround.git'
Plugin 'elzr/vim-json.git'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'w0rp/ale'
"Plugin 'alvan/vim-closetag'
Plugin 'tmhedberg/matchit'
Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'phpactor/phpactor'
"Plugin 'ncm2/ncm2'
"Plugin 'roxma/nvim-yarp'
"Plugin 'phpactor/ncm2-phpactor'
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" {{{ Window and editor setup

" Display line numbers and rulers.
set number
set norelativenumber
set ruler
syntax on

" Set encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,latin1

" Whitespace features
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noeol
set autoindent

" Enable formatting of comments, and one letter words.
" see :help fo-table
set formatoptions=qrc1

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Window settings
set wrap
set lbr
set textwidth=0

" Don't redraw when macros are executing.
set lazyredraw

" Use modeline overrides
set modeline
set modelines=10

" Status bar
set laststatus=2

" Use the system clipboard
set clipboard=unnamed

" No swap file, undofile
set noswapfile
set undofile
set undodir=~/.vim/undo

" Tab completion for filenames and other command line features. - youtube video
"set wildmenu
"set wildmode=list:longest,list:full
"set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.pyc,node_modules/*

" ctags optimization
set tags=tags;

 " fix for slow vim, syntax
set synmaxcol=1000

" Search down into subfolders (ctrlp alternative) - youtube video
"set path+=**

" }}}

" {{{ Colors

set background=dark

" }}}

" {{{ Plugins config

" CtrlP configuration
let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40

" PHP QA
let g:phpqa_messdetector_autorun = 0

" PHP Code Sniffer binary
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codesniffer_args = "--standard=CakePHP"
let g:phpqa_codesniffer_cmd = '/home/ondra/.composer/vendor/bin/phpcs'

" PDV settings
let g:pdv_template_dir = "/home/ondra/.vim/pdv-templates"

" }}}

" {{{ Filetypes

" Cakephp ctp as php file
au BufNewFile,BufRead *.ctp set filetype=php

" make uses real tabs
au FileType make setl noexpandtab

" Make ruby,scss,sass use 1 spaces for indentation.
au FileType {yaml,sass,scss,ruby,eruby,less,css,javascript} setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" php settings
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

" Javascript settings
"au FileType javascript setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

" }}}

" {{{ Mapping

let mapleader = ','

" jj as escape in insert mode
imap jj <Esc>

" OmniComplete
imap <C-@> <C-Space>
imap <C-Space> <C-x><C-o>
imap <C-j> <Down>
imap <C-k> <Up>

" NeoComplete
"imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Leader mapping
map <Leader>h :nohl<CR>
map <Leader>p :set paste!<BAR>:set paste?<CR>
map <Leader>n :call NumberToggle()<CR>
map <Leader>a <C-w><C-]><C-w>T

" NERDTree
map <Leader>t :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" TagbarToggle
map <Leader>g :TagbarToggle<CR>

" Easy motion
map <Leader>s <Plug>(easymotion-s1)
map <Leader><Leader>s <Plug>(easymotion-sn)

" PHP QA
map <Leader>qf :%!phpcbf --standard=psr2<CR>

" PDV settings
map <Leader>d :call pdv#DocumentCurrentLine()<CR>

" Js Beauty
map <Leader>fj :call JsBeautify()<CR>
map <Leader>fc :call CSSBeautify()<CR>
map <Leader>fh :call HtmlBeautify()<CR>

" Tabs
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tn :tabnew<CR>
map tc :tabclose<CR>

" Git fugitive
map gs :Gstatus<CR>
map gd :Gdiff<CR>
map gw :Gwrite<CR>
map gr :Gread<CR>
map gl :Glog<CR>
map gb :Gblame<CR>
map gm :Gmove<CR>
map ge :Gedit<CR>
map gp :Gpush<CR>
map gf :Gfetch<CR>

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'php': ['php -l'],
\}

" Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic configuration for PHP
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_exec = './bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=psr2'
let g:syntastic_php_phpmd_exec = './bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

" }}}

" {{{ Autocommands

" PHP compplete
" Enable omni completion.
autocmd FileType css,less,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" YouCompleteMe
"let g:ycm_min_num_of_chars_for_completion = 100
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']


" PHP Actor
"autocmd FileType php setlocal omnifunc=phpactor#Complete
"let g:phpactorOmniError = v:true

" SuperTab & omni completion
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" SuperTab & ycm completion
"let g:SuperTabDefaultCompletionType = '<C-n>' 

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" }}}

" {{{ Ondra updates

" higlight search
:set hlsearch

" horizontal split styling
:set t_Co=1024
let g:airline_theme='sol'
let g:airline_extensions = []

" nerdtree color
:hi Directory guifg=#FF0000 ctermfg=red

"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.ctp'

" }}}
