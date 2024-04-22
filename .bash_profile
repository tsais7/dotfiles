[ -r ~/.bashrc ] && . ~/.bashrc

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# opam configuration
test -r /home/st/.opam/opam-init/init.sh && . /home/st/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gir/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gir/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gir/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gir/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

