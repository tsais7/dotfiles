eval $(/opt/homebrew/bin/brew shellenv)

export TERM=xterm-256color
alias ll="ls -als"

alias python="python3"
alias gits="git status -uno"
alias flip="ssh tsais@access.engr.oregonstate.edu"
alias cgrb="ssh -p 732 tsais@shell.cgrb.oregonstate.edu"
alias cgrbf="ssh -p 732 tsais@files.cgrb.oregonstate.edu"
alias bridges2="ssh -p 22 tsaist@bridges2.psc.edu"
alias matlab="/Applications/MATLAB_R2021b.app/bin/matlab"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias config='/usr/bin/git --git-dir=/Users/gir/.cfg/ --work-tree=/Users/gir'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
