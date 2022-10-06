export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export LSCOLORS=Exfxcxdxbxegedabagacad
export CLICOLOR=1

alias ll="ls -als"
alias d="ls -alh"
alias a="ls -a"
alias mkcd="mkdir $1 && cd $1"

alias python="python3"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

alias bp-windows="st@laptop-n9qv2dej"
alias dlist="launchctl list | rg brightpattern"
alias lipod="lipo -detailed_info"

. "$HOME/.cargo/env"
