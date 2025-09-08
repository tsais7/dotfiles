export PS1='\u@\h \[\033[34m\]\w\[\033[0m\]\nλ '
export CLICOLOR=1


alias l="ls -A --color=auto --group-directories-first"
alias a="ls -a --color=auto --group-directories-first"
alias la="ls -A --color=auto"
alias ll="ls -al --color=auto"
alias d="ls -alh --color=auto"
alias mkdir="mkdir -p"
alias duh="du -sh ./*"

alias gfp="git fetch && git pull"
alias gcp="git add -u && git commit -m "+" && git push"
alias gap="git add -u && git commit --amend && git push --force-with-lease"

alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias cfgcp="cfg add -u && cfg commit -m "+" && cfg push"

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias zup="sudo zypper dup"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm"

alias py="python3"
alias python="python3"
alias pip="pip3"
alias va="source .venv/bin/activate"

alias dc="docker-compose"
alias k="kubectl"

alias st="subl"
alias sm="smerge"

alias jsw="jekyll serve --watch"
alias jb="jekyll build"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
