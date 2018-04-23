" display line numbers
set number
" display current column and line with fancy colors
set cursorcolumn
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

set spelllang=en_us

" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime 

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" remapp the new line insertion keys
nmap <C-o> O<Esc>
nmap <CR> o<Esc>
