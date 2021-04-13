" {{{ Vundle and basic settings

set nocompatible              " be iMproved, required
filetype off                  " required

" Vim Plug (vim-plug)
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'einars/js-beautify'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf.vim', {'commit': '4145f53f3d343c389ff974b1f1a68eeb39fba18b'}
Plug 'maksimr/vim-jsbeautify'
Plug 'rking/ag.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'tmhedberg/matchit' "jump between html open-close tag
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} " html
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'} " php linter
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'nelsyeung/twig.vim'
"Install Consolas NF from https://github.com/Znuff/consolas-powerline
"Set 'Consolas NF' in WindowsTerminal/Putty ..
Plug 'ryanoasis/vim-devicons' 
Plug 'lambdalisue/glyph-palette.vim'
Plug 'roxma/vim-paste-easy'

" Deprecated
"Plug 'alvan/vim-closetag'
"Plug 'arnaud-lb/vim-php-namespace'
"Plug 'craigemery/vim-autotag'
"Plug 'jiangmiao/auto-pairs'
"Plug 'joonty/vim-phpqa.git'
"Plug 'mattn/emmet-vim' "html plugin
"Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'} " emmet ul>li>span
"Plug 'phpactor/phpactor'
"Plug 'roxma/nvim-yarp'
"Plug 'shawncplus/phpcomplete.vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'w0rp/ale' "immediate syntax checking

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

" backup copy related to https://stackoverflow.com/a/55435197/2686510
set backupcopy=yes

" }}}

" {{{ Colors

set background=dark

" }}}

" {{{ Plugins config

" PHP QA
let g:phpqa_messdetector_autorun = 0

" PHP Code Sniffer binary
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codesniffer_args = "--standard=CakePHP"
let g:phpqa_codesniffer_cmd = '/home/ondra/.composer/vendor/bin/phpcs'

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

"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.ctp'

" Gutentags
set statusline+=%{gutentags#statusline()}
" ctags -R -f './tags'  --exclude='.git' --exclude='.sass-cache' --exclude='tmp' --exclude='.bundle' --exclude='*.min.*' --exclude='tags' --exclude='node_modules' --exclude='bower_components' --exclude='vendor' --exclude='*.jpg' --exclude='*.png' --exclude='*.svg' --exclude='*.ico' --exclude='*.pdf' --exclude='*.epub' ./';

" Auto Pairs
let g:AutoPairsShortcutToggle = '<p>'

" }}}

" {{{ Filetypes

" Cakephp ctp as php file
au BufNewFile,BufRead *.ctp set filetype=php

" make uses real tabs
au FileType make setl noexpandtab

" Make ruby,scss,sass use 2 spaces for indentation.
au FileType {yaml,sass,scss,ruby,eruby,less,css,javascript,json,vue} setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" php settings
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

" Javascript settings
"au FileType javascript setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

"sparkup
augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType mustache,php,javascript,jsx runtime! ftplugin/html/sparkup.vim
augroup END

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

" Leader mapping
"map <Leader>h :nohl<CR>
"map <Leader>p :set paste!<BAR>:set paste?<CR>
"map <Leader>n :call NumberToggle()<CR>
"map <Leader>a <C-w><C-]><C-w>T

" NERDTree
map <Leader>t :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Coc Prettier
"let g:prettier#config#config_precedence = 'file-override'
vmap <leader>p  :Prettier<CR>
nmap <leader>p  :Prettier<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" PHP QA
map <Leader>qf :%!phpcbf --standard=psr2<CR>

" PDV settings
map <Leader>d :call pdv#DocumentCurrentLine()<CR>

" Js Beauty
map <Leader>bj :call JsBeautify()<CR>
map <Leader>bc :call CSSBeautify()<CR>
map <Leader>bh :call HtmlBeautify()<CR>

" Tabs
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tn :tabnew<CR>
map tc :tabclose<CR>

" Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_balloons = 0

" Syntastic configuration for Sass
let g:syntastic_sass_checkers = ['scss_lint']
let g:syntastic_scss_checkers = ['scss_lint']
"let g:syntastic_scss_sass_lint_exec = 'sass-lint'
"let g:syntastic_scss_sass_lint_args = ''
let g:syntastic_scss_scss_lint_exec = 'scss-lint'
let g:syntastic_scss_scss_lint_args = '-x QualifyingElement,ImportantRule,ColorVariable,Indentation,SelectorDepth,NestingDepth,MergeableSelector,PropertySortOrder,PlaceholderInExtend'

" Syntastic configuration for PHP
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_exec = './bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=psr2'
let g:syntastic_php_phpmd_exec = './bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
	if !empty(a:errors)
		let g:syntastic_loc_list_height = min([len(a:errors), 10])
	endif
endfunction

" Fuzzy Finder
set rtp+=~/.fzf
nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>
" ag search over fzf
nmap <Leader>a :Ag<Space>

" Gutentags
set statusline+=%{gutentags#statusline()}

" }}}

" {{{ Autocommands

" Enable omni completion.
autocmd FileType css,less,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
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
