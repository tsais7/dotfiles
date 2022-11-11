export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export LSCOLORS=Exfxcxdxbxegedabagacad
export CLICOLOR=1

alias ll="ls -als"
alias d="ls -alh"
alias a="ls -a"
alias x="hx"
alias python="python3"
alias pip="pip3"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias bp-windows="st@laptop-n9qv2dej"
alias dlist="launchctl list | rg brightpattern"
alias fd="lipo -detailed_info"
alias mkre="make -j 2 USE_SSL=no VOCAL_COMPILE_TYPE=opt resiprocate"
alias bmac13="ssh sheng.tse@build-mac13.pl.bugfocus.com"

. "$HOME/.cargo/env"
