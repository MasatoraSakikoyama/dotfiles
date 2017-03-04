set splitbelow
set splitright
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set backspace=indent,eol,start

colorscheme pablo
syntax on
set number
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest

set list
set listchars=tab:>-,trail:-
set expandtab
set tabstop=4
set shiftwidth=4

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
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'https://github.com/othree/html5.vim'
NeoBundle 'https://github.com/hail2u/vim-css3-syntax'
NeoBundle 'apple-swift', {'type': 'nosync', 'base': '~/.vim/bundle/'}
NeoBundle 'scrooloose/nerdtree'
NeoBundleCheck
call neobundle#end()

filetype plugin indent on

autocmd vimenter * NERDTree

