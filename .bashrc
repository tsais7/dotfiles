if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

alias l="ls -A --color=auto"
alias ll="ls -al --color=auto"
alias d="ls -alh --color=auto"
alias mkdir="mkdir -p"
alias duh="du -sh ./*"

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias zup="sudo zypper dup"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm"

alias py="python3"
alias pip="pip3"

alias st="subl" # sublime-text

alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"

alias jsw="jekyll serve --watch"
alias jb="jekyll build"

. "$HOME/.cargo/env"

if [[ "$(uname)" == "Linux" ]]; then
    function code() {
        (flatpak run com.visualstudio.code $*)
    }
fi

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

export PATH=~/.npm-global/bin:$PATH
