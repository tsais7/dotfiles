export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export LSCOLORS=Exfxcxdxbxegedabagacad
export CLICOLOR=1

alias ll="ls -als"
alias d="ls -alh"
alias a="ls -a"
alias x="hx"
alias python="python3"
alias pip="pip3"

# git
alias gs="git status"


alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias dlist="launchctl list | rg brightpattern"
alias fd="lipo -detailed_info"
alias mkre="make -j 2 USE_SSL=no VOCAL_COMPILE_TYPE=opt resiprocate"

alias bmac13="ssh sheng.tse@build-mac13.pl.bugfocus.com"
alias baja="ssh sheng.tse@baja.pl.bugfocus.com"
alias st="/Applications/Sublime \Text.App"

. "$HOME/.cargo/env"

[ -f "/Users/gir/.ghcup/env" ] && source "/Users/gir/.ghcup/env" # ghcup-env
