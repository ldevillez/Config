filetype on

" Syntax highlighting
syntax on
syntax enable
set cursorline " line cursor
" set line number
set number
" Tabulation size
set tabstop=2
set autoindent
set expandtab " replace tab by space
set softtabstop=2 "Remote tab by 2
set shiftwidth=2
set backspace=2 "make backspace work like most other program

" autoreload file after change
set autoread

" ??
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
" set notimeout

" search
set ignorecase " ignore case when searching
set smartcase  " turn on smartcase

" Autocomplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set splitbelow

" Status bar
let g:airline_theme='luna'

" leader
let mapleader = " "
let maplocalleader = " "


" Code jump
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


" NERDTree
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowHidden=1


" Latex
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

let g:livepreview_previewer = 'zathura'

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

" Tizk extrenalize
let g:vimtex_compiler_latexmk = {
  \ 'options' : [
  \   '-pdf',
  \   '-shell-escape',
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
  \}

let g:vimtex_toc_config = {
  \ 'name' : 'TOC',
  \ 'layers' : ['content', 'todo', 'include'],
  \ 'resize' : 1,
  \ 'split_width' : 50,
  \ 'todo_sorted' : 0,
  \ 'show_help' : 1,
  \ 'show_numbers' : 1,
  \ 'mode' : 1,
  \}

let g:tex_conceal = ''
set conceallevel=0

" Syntax checking and linting
let g:ale_fixers = {
  \ "*": ["remove_trailing_lines", "trim_whitespace"],
  \ "tex": ["latexindent", "textlint"]
  \}
let g:ale_linters = {
  \   'markdown': ['mdl'],
  \   'bib': ['bibclean'],
  \   'latex': ['proselint', 'chktex', 'lacheck'],
  \   'tex': 'all',
  \   'plaintex': ['proselint', 'chktex', 'lacheck'],
  \   'python': ['flake8', 'pylint', 'pyls'],
  \   'text': ['proselint', 'write-good'],
  \   'vim': ['vint'],
\}
let g:ale_fix_on_save = 1

" Load keymaps
runtime ./maps.vim

" Load all plugins now.
lua require('plugins')
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
