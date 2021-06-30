" {{{ Vundle and basic settings

set nocompatible              " be iMproved, required
filetype off                  " required

" Vim Plug (vim-plug)
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim', {'commit': '4145f53f3d343c389ff974b1f1a68eeb39fba18b'}
Plug 'rking/ag.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'tmhedberg/matchit' "jump between html open-close tag
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nelsyeung/twig.vim'
Plug 'dense-analysis/ale'

"Devicons: Install Consolas NF from https://github.com/Znuff/consolas-powerline
"Devicons: Set 'Consolas NF' in WindowsTerminal/Putty ..
Plug 'ryanoasis/vim-devicons' 
Plug 'lambdalisue/glyph-palette.vim'

" Comments with templates
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

" All of your Plugins must be added before the following line
call plug#end()

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

" ctags optimization
"set tags=tags;

" fix for slow vim, syntax
set synmaxcol=1000

" enable mouse
set mouse=a

" performance 
set regexpengine=1
syntax sync minlines=64  " faster syntax hl

" backup copy related to https://stackoverflow.com/a/55435197/2686510
set backupcopy=yes

" }}}

" {{{ Colors

set background=dark

" }}}

" {{{ Plugins config

" PDV settings
let g:pdv_template_dir = "/home/ondra/.vim/pdv-templates"

" higlight search
:set hlsearch

" horizontal split styling
:set t_Co=1024
let g:airline_theme='sol'
let g:airline_extensions = []

" nerdtree color
:hi Directory guifg=#FF0000 ctermfg=148 "https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim 

" devicons
augroup my-glyph-palette
	autocmd! *
	autocmd FileType fern call glyph_palette#apply()
	autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" Gutentags
set statusline+=%{gutentags#statusline()}
" ctags -R -f './tags'  --exclude='.git' --exclude='.sass-cache' --exclude='tmp' --exclude='.bundle' --exclude='*.min.*' --exclude='tags' --exclude='node_modules' --exclude='bower_components' --exclude='vendor' --exclude='*.jpg' --exclude='*.png' --exclude='*.svg' --exclude='*.ico' --exclude='*.pdf' --exclude='*.epub' ./';

" Ale
map <Leader>f :ALEFix<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'php': ['php -l'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'less': ['prettier'],
\   'html': ['prettier'],
\   'php': ['prettier'],
\}
let g:ale_fix_on_save = 1

"https://github.com/neoclide/coc.nvim/issues/560#issuecomment-578629707
let g:coc_global_extensions = [
   \'coc-json',
   \'coc-emmet',
   \'coc-lists',
   \'coc-highlight',
   \'coc-html',
   \'coc-htmlhint',
   \'coc-markdownlint',
   \'coc-html-css-support',
   \'coc-phpls',
   \'coc-snippets',
   \'coc-vimlsp',
   \'coc-json',
   \'coc-css',
   \'coc-cssmodules',
   \'coc-swagger',
   \'coc-yaml',
   \'coc-git'
\]

" }}}

" {{{ Filetypes

" Cakephp ctp as php file
au BufNewFile,BufRead *.ctp set filetype=php

" Cakephp twig as html file
au BufNewFile,BufRead *.twig set filetype=html

" make uses real tabs
au FileType make setl noexpandtab

" Make ruby,scss,sass,javascript,json,vue  use 2 spaces for indentation.
au FileType {yaml,sass,scss,ruby,eruby,less,css,javascript,json,vue} setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" php settings
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

" }}}

" {{{ Mapping

let mapleader = ','

" jj as escape in insert mode
imap jj <Esc>

" OmniComplete
"imap <C-@> <C-Space>
"imap <C-Space> <C-x><C-o>
"imap <C-j> <Down>
"imap <C-k> <Up>

" Leader mapping
"map <Leader>h :nohl<CR>
map <Leader>p :set paste!<BAR>:set paste?<CR>
"map <Leader>n :call NumberToggle()<CR>
"map <Leader>a <C-w><C-]><C-w>T

" NERDTree
map <Leader>t :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Twig plugin
let g:neosnippet#snippets_directory='~/.vim/bundle/twig.vim/neosnippets'

" PHP QA
map <Leader>qf :%!phpcbf --standard=psr2<CR>

" PDV settings
map <Leader>d :call pdv#DocumentCurrentLine()<CR>

" Tabs
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tn :tabnew<CR>
map tc :tabclose<CR>

" Fuzzy Finder
set rtp+=~/.fzf
nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>

" ag search over fzf
nmap <Leader>a :Ag<Space>

" }}}

" {{{ Autocommands

" Enable omni completion.
"autocmd FileType css,less,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType json syntax match Comment +\/\/.\+$+

" PHP compplete
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" SuperTab & omni completion
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Remember last location in file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal g'\"" | endif
endif

" }}}
