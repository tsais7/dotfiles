export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export LSCOLORS=Exfxcxdxbxegedabagacad
export CLICOLOR=1

alias l="ls -a"
alias ll="ls -als"
alias d="ls -alh"
alias a="ls -a"
alias x="hx"

alias python="python3"
alias pip="pip3"

alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias cdr="cd my-repos"
alias fd="lipo -detailed_info"

alias st="/Applications/Sublime \Text.App"

[ -f "/Users/gir/.ghcup/env" ] && source "/Users/gir/.ghcup/env" # ghcup-env
