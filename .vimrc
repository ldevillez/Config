set nocompatible
call pathogen#infect()
call pathogen#helptags()
set number
filetype plugin indent on
syntax on
runtime! config/**/*.vim
nmap <F8> :TagbarToggle<CR>
nmap <F2> :NERDTree<CR>

"error finder
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
