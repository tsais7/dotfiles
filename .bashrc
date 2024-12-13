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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gir/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gir/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gir/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gir/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

