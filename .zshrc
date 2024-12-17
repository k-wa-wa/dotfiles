##############################
########## install zinit
##############################
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

##############################
########## zinit plugin
##############################
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

##############################
########## theme
##############################
eval "$(starship init zsh)"

##############################
########## alias
##############################
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'

##############################
########## history
##############################
## 履歴保存管理
HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# 重複を記録しない
setopt hist_ignore_dups

## パスを直接入力してもcdする
setopt auto_cd
## cd履歴を保存
setopt auto_pushd

## 環境変数を補完
setopt AUTO_PARAM_KEYS

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 補完時にヒストリを自動的に展開
setopt hist_expand

# aliasでも補完
setopt complete_aliases

# 上矢印キーで履歴検索を前に
autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
# 下矢印キーで履歴検索を後に
autoload -Uz down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
# 上矢印キー
bindkey '\e[A' history-search-backward
# 下矢印キー
bindkey '\e[B' history-search-forward

fastfetch