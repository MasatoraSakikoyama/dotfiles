set splitbelow
set splitright
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set backspace=indent,eol,start
set clipboard=unnamed,autoselect

colorscheme pablo
syntax on
set list
set listchars=tab:>-,trail:-
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
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" python pdb"
inoremap pdb<Space> import pdb;pdb.set_trace()

set nocompatible
filetype off

if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'https://github.com/othree/html5.vim'
NeoBundle 'https://github.com/hail2u/vim-css3-syntax'
NeoBundle 'apple-swift', {'type': 'nosync', 'base': '~/.vim/bundle/'}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jpo/vim-railscasts-theme'
call neobundle#end()

filetype plugin indent on

let NERDTreeShowHidden = 1 " 隠しファイル表示
autocmd vimenter * NERDTree
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
