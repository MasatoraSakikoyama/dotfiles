export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ "${TERM_PROGRAM:-}" == "Apple_Terminal" ]] && [[ "${TERM:-}" == "xterm-color" ]]; then
  export TERM=xterm-256color
fi

bindkey -v

setopt auto_pushd
setopt pushd_ignore_dups
setopt print_eight_bit
setopt no_beep
setopt ignore_eof
setopt interactive_comments
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt complete_in_word
setopt no_flow_control
setopt extended_glob
setopt prompt_subst

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'

if [[ "$OSTYPE" == darwin* ]]; then
  export LSCOLORS=gxfxcxdxbxegedabagacad
  zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"
  alias l='ls -CFG'
  alias la='ls -AG'
  alias ll='ls -alFG'
else
  alias l='ls --color=auto'
  alias la='ls -A --color=auto'
  alias ll='ls -alF --color=auto'
  alias grep='grep --color=auto'
fi

if command -v brew >/dev/null 2>&1; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

autoload -Uz compinit
compinit -u

autoload -Uz colors
colors

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /opt/homebrew/sbin /opt/homebrew/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:processes' command 'ps x -o pid,state,args'

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

_vcs_precmd() {
  vcs_info
}

add-zsh-hook precmd _vcs_precmd
PROMPT='%~ ${vcs_info_msg_0_}$ '

[[ -f "${HOME}/.zshrc.local" ]] && source "${HOME}/.zshrc.local"
