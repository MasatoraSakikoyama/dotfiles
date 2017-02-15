"--------------------
" 基本的な設定
"--------------------
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright
" netrwは常にtree view
let g:netrw_liststyle = 3
"netrwでCVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\ '
" netrwで新しいウィンドウを下に分割する
let g:netrw_alto = 1
" netrwで新しいウィンドウを右に分割する
let g:netrw_altv = 1
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" backspace
set backspace=indent,eol,start

" 見た目系
" カラースキーム
colorscheme pablo
" シンタックスカラー
syntax on
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化
set list
set listchars=tab:>-,trail:.
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" " 行頭でのTab文字の表示幅
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" python pdb"
inoremap pdb<Space> import pdb;pdb.set_trace()

" neo bundole
set nocompatible
filetype off            " for NeoBundle

if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" python
NeoBundle 'davidhalter/jedi-vim'
" javascript
NeoBundle 'pangloss/vim-javascript'
" jsx
NeoBundle 'mxw/vim-jsx'
" html5
NeoBundle 'https://github.com/othree/html5.vim'
" css3
NeoBundle 'https://github.com/hail2u/vim-css3-syntax'
" swift
NeoBundle 'apple-swift', {'type': 'nosync', 'base': '~/.vim/bundle/'}
call neobundle#end()

filetype plugin indent on     " required!
