export PS1='\u@\h \[\033[34m\]\w\[\033[0m\]\nλ '
export CLICOLOR=1

alias l="gls -A --color=auto --group-directories-first"
alias a="gls -a --color=auto --group-directories-first"
alias la="ls -A --color=auto"
alias ll="ls -al --color=auto"
alias d="ls -alh --color=auto"

alias mkdir="mkdir -p"

alias duh="du -sh ./*"
alias dud="du -hd 1 ."

alias py="python3"
alias python="python3"

alias gfp="git fetch && git pull"
alias gcp="git add -u && git commit -m "+" && git push"
alias gap="git add -u && git commit --amend && git push -f"

alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias cfgcp="cfg add -u && cfg commit -m "+" && cfg push"

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias zup="sudo zypper dup"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm"

alias va="source .venv/bin/activate"

alias dc="docker-compose"
alias k="kubectl"

alias st="subl"
alias sm="smerge"

eval "$(fzf --bash)"
