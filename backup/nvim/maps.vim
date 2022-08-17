" " Bepo remap for nvim
" Mouvement
noremap t h
noremap n l
noremap s k
noremap r j

" get in insert Mode
noremap u o
noremap U O

" Motion
" Move to last line printed
noremap h L
" noremap O H
" undo
noremap z u
noremap <C-z> <C-r>

" Move by word
" é jump start of word
" p jump to end of word
" b jumpb backward by word
" 0 start of line
" $ end of line
noremap é w
noremap É W
noremap p e
noremap P E

" Copy & paste
noremap à p
noremap À P
noremap ê r

" Search
noremap l n
noremap L N

" Move direction between windows
noremap <S-s>t <C-w>h
noremap <S-s>r <C-w>j
noremap <S-s>s <C-w>k
noremap <S-s>n <C-w>l

" Move between tabs
noremap <C-t> :tabprevious<CR>
noremap <C-n> :tabnext<CR>

" Move between suggestions
inoremap <C-p> <C-r>
inoremap <expr> <C-r> pumvisible() ? "\<C-p>" : "\<C-r>"
inoremap <expr> <C-s> pumvisible() ? "\<C-n>" : "\<C-s>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-s>"

" Code jump

" NerdTree
nnoremap <leader>t :NERDTreeFocus<CR>
let NERDTreeMapRefresh='d'
let NERDTreeMapRefreshRoot='D'
let NERDTreeMapOpenVSplit='v'
let NERDTreeMenuUp='s'
let NERDTreeMenuDown='r'

" Snippets
" Trigger configuration
let g:UltiSnipsExpandTrigger='<tab>'
" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-t>'
" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-s>'

" Latex
function! TocMappings()
  map s k
  map r j
endfunction
