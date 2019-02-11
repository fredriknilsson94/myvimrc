set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = "\<Space>"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
      
" NERDtree
Plugin 'scrooloose/nerdtree'
" YouCompleteMe auto-completion
Plugin 'valloric/youcompleteme'
" Sublime monokai color theme
Plugin 'erichdongubler/vim-sublime-monokai'
" Vim commentary
Plugin 'tpope/vim-commentary'
" Jenkinsfile syntax stuff
Plugin 'martinda/jenkinsfile-vim-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set showmode
set autoread

syntax on
colorscheme sublimemonokai

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

set scrolloff=5
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" turn swap files OFF
set noswapfile

set tabstop=2
set shiftwidth=2
set expandtab

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

function! GetBranchName(_) abort
  let b:branch_name = systemlist("git rev-parse --abbrev-ref HEAD 2> /dev/null || echo ''")[0]
endfunction
call timer_start(1000, function('GetBranchName'), {'repeat': -1})
autocmd BufEnter,BufWritePost * call GetBranchName("")

set laststatus=2
set statusline=%f " tail of the filename
set statusline+=\ c:%c " column number
set statusline+=%= " switching to right side
set statusline+=%(%{b:branch_name}%)
