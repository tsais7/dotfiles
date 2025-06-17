export PS1='\u@\h \[\033[34m\]\w\[\033[0m\]\nλ '
export CLICOLOR=1

alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"

alias l="ls -A --color=auto"
alias a="ls -a --color=auto"
alias la="ls -A --color=auto"
alias ll="ls -al --color=auto"
alias d="ls -alh --color=auto"
alias mkdir="mkdir -p"
alias duh="du -sh ./*"

alias gfp="git fetch && git pull"
alias gcp="git add -u && git commit -m "+" && git push"

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias zup="sudo zypper dup"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm"

alias py="python3"
alias python="python3"
alias pip="pip3"
alias st="subl" # sublime-text

alias jsw="jekyll serve --watch"
alias jb="jekyll build"

