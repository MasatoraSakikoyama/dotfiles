set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'posva/vim-vue'
Plugin 'kylef/apiblueprint.vim'
call vundle#end()
filetype plugin indent on

syntax enable
set list
set number
set title
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set splitbelow
set splitright
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set backspace=indent,eol,start
set clipboard=unnamed
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" python pdb"
inoremap pdb<Space> import pdb;pdb.set_trace()

autocmd FileType vue syntax sync fromstart

let NERDTreeShowHidden = 1
nnoremap <silent><C-n> :NERDTreeToggle<CR>

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab
augroup END

colorscheme railscasts
