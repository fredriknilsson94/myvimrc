set nocompatible              " be iMproved, required

let mapleader = "\<Space>"

" " if behind proxy
" " BEGIN
" let $GIT_SSL_NO_VERIFY = 'true'

" " Vim Plug plugin manager
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs --insecure
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
" " END

" Vim Plug plugin manager normal use
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Vim diff and merge tool improvement
Plug 'whiteinge/diffconflicts'
" NERDtree
Plug 'scrooloose/nerdtree'
" Sublime monokai color theme
Plug 'erichdongubler/vim-sublime-monokai'
" Vim commentary
Plug 'tpope/vim-commentary'
" Jenkinsfile syntax stuff
Plug 'martinda/jenkinsfile-vim-syntax'
" YouCompleteMe auto-completion
Plug 'valloric/youcompleteme'
" Git vim wrapper
Plug 'tpope/vim-fugitive'
" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" Put your non-Plugin stuff after this line

set showmode
set autoread

set hlsearch
nnoremap <Leader>n :set hlsearch! hlsearch?<CR>

set nowrap

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undo//

syntax on
colorscheme sublimemonokai

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" quick access to display registers
nnoremap <Leader>r :reg<CR>

set scrolloff=5
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set tabstop=2
set shiftwidth=2
set expandtab

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDtree settings
nnoremap <Leader>t :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" YouCompleteMe settings
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gi :YcmCompleter GoToInclude<CR>

set splitbelow
set splitright

" vim diff colors
hi DiffAdd    cterm=NONE ctermbg=2 ctermfg=white
hi DiffChange cterm=NONE ctermbg=3 ctermfg=white
hi DiffDelete cterm=NONE ctermbg=1 ctermfg=white
hi DiffText   cterm=NONE ctermbg=3 ctermfg=white
