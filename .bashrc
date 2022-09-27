export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export LSCOLORS=Exfxcxdxbxegedabagacad
export CLICOLOR=1

alias ll="ls -als"
alias la="ls -a"
alias python="python3"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias bp-windows="st@laptop-n9qv2dej"

. "$HOME/.cargo/env"
