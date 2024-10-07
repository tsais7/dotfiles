#export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
#export LSCOLORS=Exfxcxdxbxegedabagacad
export CLICOLOR=1

alias l="ls -a"
alias ll="ls -als"
alias d="ls -alh"

alias python="python3"
alias pip="pip3"

alias st="subl" # sublime-text

alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"

alias jsw="jekyll serve --watch"
alias jb="jekyll build"

if [[ "$(uname)" == "Linux" ]]; then
    function code() {
        (flatpak run com.visualstudio.code $*)
    }
fi

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

. "$HOME/.cargo/env"
