export LANG=en_US.UTF-8
bindkey -v
# cd後、自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beepを無効
setopt no_beep
# Ctrl+Dでzshを終了しない
setopt ignore_eof
# '#'以降をコメントとして扱う
setopt interactive_comments
#同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs
# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types
# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu
# カッコの対応などを自動的に補完
setopt auto_param_keys
# 語の途中でもカーソル位置で補完
setopt complete_in_word
setopt no_flow_control
setopt extended_glob
# エイリアス
alias la='ls -a'
alias ll='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias sudo='sudo '
# 補完機能を有効にする
autoload -Uz compinit
compinit
# 色を使用出来るようにする
autoload -Uz colors
colors
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
/usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# プロンプト
PROMPT="%{${fg[cyan]}%}%n@%m%{${reset_color}%}:%~$ "
# tmux用設定スクリプトの読み込み
if [ -f ~/.zsh/.zsh_tmux ]; then
    . ~/.zsh/.zsh_tmux
fi
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        # Mac用の設定
        export PATH=/usr/local:$PATH
        LSCOLORS=gxfxcxdxbxegedabagacad
        if [ -n "$LSCOLORS" ]; then
            zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
        fi
        export LSCOLORS
        alias ll='ls -alFG'
        alias la='ls -AG'
        alias l='ls -CFG'
        ;;
    linux*)
        # Linux用の設定
        if [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
            alias grep='grep --color=auto'
        fi
        ;;
esac
# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
