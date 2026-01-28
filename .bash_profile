[[ $TMUX != "" ]] && export TERM="screen-256color"

if [[ "$(uname)" == "Darwin" ]]; then
    [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
    export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
    
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
    export PATH="/Applications/Sublime Merge.app/Contents/SharedSupport/bin:$PATH"

    export PATH="$HOME/.local/bin:$PATH"

elif [[ "$(uname)" == "Linux" ]]; then
    export JAVA_HOME="/usr/lib64/jvm/jre-11-openjdk"
    export PATH="$JAVA_HOME/bin:$PATH"
fi

. "$HOME/.cargo/env"

export PIP_REQUIRE_VIRTUALENV=true

[[ -f ~/.bashrc ]] && . ~/.bashrc

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
