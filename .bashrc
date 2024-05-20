export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export LSCOLORS=Exfxcxdxbxegedabagacad
export CLICOLOR=1

alias l="ls -a"
alias ll="ls -als"
alias d="ls -alh"
alias a="ls -a"

alias python="python3"
alias pip="pip3"

alias cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"

alias fd="lipo -detailed_info"

[ -f "/Users/gir/.ghcup/env" ] && . "/Users/gir/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/st/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/st/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/st/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/st/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
