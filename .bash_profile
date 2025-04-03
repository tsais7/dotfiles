if [ -f ~/.bashrc ]; then
        source ~/.bashrc
fi

[[ $TMUX != "" ]] && export TERM="screen-256color"

if [[ "$(uname)" == "Darwin" ]]; then
    [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
    export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
    
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

    export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

elif [[ "$(uname)" == "Linux" ]]; then
    export JAVA_HOME="/usr/lib64/jvm/jre-11-openjdk"
    export PATH="$JAVA_HOME/bin:$PATH"
fi

export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

. "$HOME/.cargo/env"

# Added by `rbenv init` on Mon Oct  7 18:50:54 +08 2024
eval "$(rbenv init - --no-rehash bash)"

# npm
export PATH=~/.npm-global/bin:$PATH

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '$HOME/.opam/opam-init/init.sh' && . '/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration


