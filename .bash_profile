[[ $TMUX != "" ]] && export TERM="screen-256color"

if [[ "$(uname)" == "Darwin" ]]; then
    [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
    export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
    
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
    export PATH="/Applications/Sublime Merge.app/Contents/SharedSupport/bin:$PATH"


elif [[ "$(uname)" == "Linux" ]]; then
    export JAVA_HOME="/usr/lib64/jvm/jre-11-openjdk"
    export PATH="$JAVA_HOME/bin:$PATH"

fi

export PIP_REQUIRE_VIRTUALENV=true

. "$HOME/.cargo/env"

export PATH=~/.npm-global/bin:$PATH

export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

eval "$(rbenv init - --no-rehash bash)"

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

test -r "$HOME/.opam/opam-init/init.sh" && . "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true 

[[ -f ~/.bashrc ]] && . ~/.bashrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
