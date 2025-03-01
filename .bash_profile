[ -r ~/.bashrc ] && . ~/.bashrc

[[ $TMUX != "" ]] && export TERM="screen-256color"

if [[ "$(uname)" == "Darwin" ]]; then
    [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
    export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
    
    export PATH="$PATH:/home/gir/.local/share/JetBrains/Toolbox/scripts"

    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

    export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"
fi

export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

. "$HOME/.cargo/env"

# Added by `rbenv init` on Mon Oct  7 18:50:54 +08 2024
eval "$(rbenv init - --no-rehash bash)"

# Added by Toolbox App
export PATH="$PATH:/Users/st/Library/Application Support/JetBrains/Toolbox/scripts"

# npm
export PATH=~/.npm-global/bin:$PATH
