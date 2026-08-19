export PS1='\[\033[34m\]\w\[\033[0m\]\n$ '
export CLICOLOR=1

if [[ "$(uname)" == "Darwin" ]]; then
    alias ls="gls";
    alias cxx='clang++ -std=c++20 -Wall -Wextra -g'
    alias cxxo='clang++ -std=c++20 -O3 -march=native'
    alias cxxs='clang++ -std=c++20 -Wall -Wextra -fsanitize=address,undefined'
    alias cxxt='clang++ -std=c++20 -fsanitize=thread'
else 
    alias cxx='g++ -std=c++20 -Wall -Wextra -g'
    alias cxxo='g++ -std=c++20 -O3 -march=native'
    alias cxxs='g++ -std=c++20 -Wall -Wextra -fsanitize=address,undefined'
    alias cxxt='g++ -std=c++20 -fsanitize=thread'

fi
alias l="ls -A --color=auto --group-directories-first"
alias a="ls -a --color=auto --group-directories-first"
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
alias cfgfp="cfg fetch && cfg pull"

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias zup="sudo zypper dup"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm"
alias zrf="sudo zypper refresh"

alias va="source .venv/bin/activate"

alias dc="docker-compose"
alias k="kubectl"

alias st="subl"
alias sm="smerge"

eval "$(fzf --bash)"

[ -f "/home/gir/.ghcup/env" ] && . "/home/gir/.ghcup/env" # ghcup-env