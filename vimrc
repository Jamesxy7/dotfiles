" ==================================
" vimrc
" ==================================

if !has('nvim')
    set nocompatible
endif

" Plugins {{{
call plug#begin('~/.vim/plugged')

" Eye-Candy
Plug 'chriskempson/base16-vim'
Plug 'whatyouhide/vim-gotham'

"Plug 'mhartington/oceanic-next'
"
if !exists('g:gui_oni')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
endif

" Better behavior
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'

Plug 'junegunn/vim-slash'    " better search
Plug 'tpope/vim-speeddating' " <C-A> works with dates now

Plug 't9md/vim-choosewin'    " switch between windows
Plug 'Valloric/ListToggle'   " toggle location/quickfix list
Plug 'Raimondi/delimitMate'  " matching delimiters

Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf'}
Plug 'junegunn/fzf.vim'

" Better Visual Guide
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" Utilities & Commands
Plug 'tpope/vim-eunuch'
Plug 'pbrisbin/vim-mkdir'
Plug 'takac/vim-commandcaps'

" Tag
Plug 'majutsushi/tagbar'
Plug 'jsfaint/gen_tags.vim'
"Plug 'ludovicchabant/vim-gutentags'
"
" File system
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" syntax check
Plug 'w0rp/ale'

" terminal
Plug 'kassio/neoterm'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Autocomplete
if has('nvim')
  Plug 'Shougo/echodoc.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/neco-vim', {'for': 'vim'}
  Plug 'zchee/deoplete-jedi', {'for': 'python'}
else
  Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py', 'for': ['python', 'cpp', 'tex', 'vim'] }
endif

" Latex
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'matze/vim-tex-fold', {'for': 'tex'}

" Python
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'tweekmonster/braceless.vim', {'for': 'python'}

" kdb/q
Plug 'katusk/vim-qkdb-syntax', {'for': 'q'}

" Debugger and formater
" Plug 'Chiel92/vim-autoformat', { 'for': ['cpp', 'python', 'typescript'] }

" Not used
" Plug 'tpope/vim-projectionist'
" Plug 'vim-jp/vim-cpp', {'for': 'cpp'}
" Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

call plug#end()

syntax on
filetype plugin indent on
" }}}

" UI configuration {{{
syntax enable

" colorscheme
let base16colorspace=256
colorscheme base16-solarized-dark
set background=dark

set list
set listchars=tab:▸\ ,eol:¬

set nowrap
set number
set mouse=a
set nolazyredraw
set noshowmatch
set relativenumber
set wildmenu

set history=200

set t_Co=256
set t_ut=


if exists('g:gui_oni')
    set noruler
    set noshowcmd
    set laststatus=0
else
    set ruler
    set showcmd
    set laststatus=2
endif

set guifont=Sauce\ Code\ Powerline:h11
if has('nvim')
    set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:block
endif

" True Color Support
if (has("termguicolors"))
    set termguicolors
    let NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" turn off scroll bar if using MacVim
if has("gui_running")
   set linespace=1
   set guioptions=gm
   set fuoptions=maxvert,maxhorz
endif

set encoding=utf-8
scriptencoding utf-8

" }}}

" General Config {{{
set ttimeout
set ttimeoutlen=100

" Turn off sound
set vb
set t_vb=

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Auto reload file
set autoread

" use comma as leader key
let mapleader   = ","
let g:mapleader = ","

" Navigation key configuration
map j gj
map k gk
nnoremap <c-h> g0
nnoremap <c-l> g$
set whichwrap+=<,>,h,l
set backspace=eol,start,indent

nmap <F2> :set nowrap! <cr>
nmap <c-s> :w!<cr>
nmap <leader>w :w!<cr>
nmap <leader>e :NERDTreeToggle<cr>
nnoremap <leader><space> :nohlsearch<cr>

" Search configuration
set ignorecase                                      " ignore case when searching
set smartcase                                       " turn on smartcase
set hlsearch                                        " highlight search
set incsearch                                       " incremental search (search as type)

" Tab and Indent configuration
set ai                                              " Auto indent
set si                                              " Smart indent
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
"set cinoptions+=L0
set cinoptions+=g0

" buffer
set hidden
"nnoremap <c-e><c-n> :bn<CR>
"nnoremap <c-e><c-p> :bN<CR>

" Folding
set foldenable                                      " enable folding
set foldnestmax=10                                  " max 10 depth
set foldmethod=syntax                               " fold based on indent level
set foldlevelstart=10                               " start with fold level of 1
nnoremap <space> za                                 " space open/closes folds

" }}}

" Behavior  {{{
inoremap <c-c> <ESC>

set shortmess+=c
set clipboard+=unnamedplus

" Move between windows
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

" H & L
vnoremap H ^
vnoremap L $

" Don't go to Ex mode
nnoremap Q <nop>

" Stay in visual after shifting
vmap < <gv
vmap > >gv

" Editing/Loading .vimrc
nnoremap <c-e><c-v> :vs ~/.vimrc<cr>

" Fold All but current
nnoremap <leader>f zMzvzz

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
" }}}

let g:python3_host_prog = '/usr/local/bin/python3'

" vim-Plug {{{
command! PU PlugUpdate | PlugUpgrade
command! PS PlugStatus
command! PC PlugClean
" }}}

" NERDTree {{{
let NERDTreeNaturalSort=1
" }}}

" Tagbar {{{
nnoremap <F8> :TagbarToggle<cr>
let g:tagbar_previewwin_pos = "aboveleft"
" }}}

" vim-airline {{{
let g:airline_powerline_fonts = 1
"let g:airline_left_sep  = ''
"let g:airline_right_sep = ''

" tabline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep       = ''
"let g:airline#extensions#tabline#left_alt_sep   = ''
"let g:airline#extensions#tabline#right_sep      = ''
"let g:airline#extensions#tabline#right_alt_sep  = ''
let g:airline#extensions#tabline#fnamemod       = ':t'       " Show just the filename

" quickfix
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix' " configure the title text for quickfix buffers
let g:airline#extensions#quickfix#location_text = 'Location' " configure the title text for location list buffers

" ycm
let g:airline#extensions#ycm#error_symbol   = 'E:'           " set error count prefix
let g:airline#extensions#ycm#warning_symbol = 'W:'           " set warning count prefix
" }}}

" YCM {{{
let g:ycm_python_binary_path = 'python3'
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" YCM semantic trigger
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers.python = ['.', 're!\w{2}']

" }}}

" UltiSnips {{{
"
" use python3 for UltiSnips
let g:UltiSnipsUsePythonVersion = 3

" key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsEditSplit = "vertical"
nnoremap <c-e><c-u> :UltiSnipsEdit<cr>

" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" from vimtex
let g:vimtex#re#deoplete = '\\(?:'
      \.'\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \.'|(text|block)cquote\*?(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \.'|(for|hy)\w*cquote\*?{[^}]*}(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \.'|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \.'|hyperref\s*\[[^]]*'
      \.'|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \.'|(?:include(?:only)?|input)\s*\{[^}]*'
      \.'|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \.'|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \.'|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \.'|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
      \.'|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
      \.'|\w*'
      \.')'

let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" deoplete-jedi
let g:deoplete#sources#jedi#show_docstring = 1

" auto close preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}

" python-syntax {{{
let python_highlight_all = 1

augroup MyPython
    autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
    autocmd FileType python let NERDDefaultAlign="left"
augroup END
" }}}

" vimtex {{{
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1

let g:vimtex_view_method = 'skim'
let g:vimtex_view_automatic = 1

let g:vimtex_toc_fold = 1
let g:vimtex_format_enabled = 1

if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
endif

let g:tex_fold_override_foldtext = 1
let g:tex_fold_additional_envs = [
    \ 'proposition',
    \ 'matrix',
    \ 'claim',
    \ 'remark',
    \ 'lemma',
    \ 'theorem',
    \ 'warning',
    \ 'proof',
    \ 'minted',
    \ 'itemize',
    \ 'example',
    \ 'corollary',
    \ 'enumerate']

let g:vimtex#re#ncm = [
    \ '\\[A-Za-z]*',
    \ '\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ '\\(text|block)cquote\*?(\[[^]]*\]){0,2}{[^}]*',
    \ '\\(for|hy)[A-Za-z]*cquote\*?{[^}]*}(\[[^]]*\]){0,2}{[^}]*',
    \ '\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ '\\hyperref\[[^]]*',
    \ '\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ '\\(include(only)?|input){[^}]*',
    \ '\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ '\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ '\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
    \ '\\usepackage(\s*\[[^]]*\])?\s*\{[^}]*',
    \ '\\documentclass(\s*\[[^]]*\])?\s*\{[^}]*',
    \]

let g:vimtex#re#youcompleteme = map(copy(g:vimtex#re#ncm), "'re!' . v:val")

let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-pdf',
      \   '--shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'packages' : { 'hyperref' : 0, },
      \}

augroup MyVimtex
  autocmd!
  autocmd User VimtexEventQuit VimtexClean
  autocmd FileType tex nnoremap <leader>lv :VimtexView<cr>
  autocmd FileType tex nnoremap <leader>lc :VimtexClean<cr>
  autocmd FileType tex nnoremap <leader>lC :VimtexClean!<cr>
  autocmd FileType tex nnoremap <leader>le :VimtexError<cr>
  autocmd FileType tex nnoremap <leader>ll :VimtexCompile<cr>
  autocmd FileType tex nnoremap <leader>lt :VimtexTocToggle<cr>

  autocmd FileType tex setlocal spell linebreak "norelativenumber
  autocmd FileType tex setlocal conceallevel=2
  autocmd FileType tex let b:delimitMate_quotes="\" '"
augroup END

" }}}

" FZF {{{
nnoremap <c-f> :Lines<cr>
nnoremap <c-p> :Ag<cr>


let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Insert mode completion
imap <c-x><c-l> <plug>(fzf-complete-line)

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}}

" Ale {{{
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'cpp': ['clang'],
    \   'vim': ['vint'],
    \}
" }}}

" {{{ FastFold
let g:tex_fold_enabled = 1
let g:fastfold_skip_filetypes = ['taglist', 'Tagbar', 'NERD']
let g:fastfold_fdmhook = 1
" }}}

" q {{{
augroup MyKDBQ
  autocmd!
  autocmd BufRead,BufNewFile *.q set filetype=q
augroup END
" }}}

" gen_tags {{{
let g:gen_tags#use_cache_dir = 1
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1
let g:gen_tags#blacklist = ['$HOME']
" }}}"

" neoterm {{{
let g:neoterm_repl_python='ipython3'
nnoremap <c-e><c-t> :Ttoggle<cr>
"nnoremap <c-s> :TREPLSendLine<cr>
nnoremap <c-s> :call SendLineOrClear()<cr>
vnoremap <c-s> :TREPLSendSelection<cr>
" }}}

" echodoc {{{
let g:echodoc_enable_at_startup = 1
" }}}

function! SendLineOrClear()
  let current_line = getline('.')
  if (current_line == '')
    call neoterm#clear()
  else
    TREPLSendLine
  endif
endfunction

" vim:foldmethod=marker:foldlevel=0
