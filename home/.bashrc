#!/bin/bash

case $- in
    *i*) ;;
      *) return;;
esac

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1='\[\e[38;5;35m\]\w\[\e[0m\]\\$ '
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

function l {
    cd "$(command lf -print-last-dir "$@")"
}

function rangercd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

# For seL4/l4v to work
export L4V_ARCH=ARM

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f "/home/christianpardillolaursen/.ghcup/env" ] && source "/home/christianpardillolaursen/.ghcup/env" # ghcup-env
. "$HOME/.cargo/env"

# Setup zoxide
eval "$(zoxide init bash)"

# dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Flutter binaries
export PATH="$PATH":"$HOME/.pub-cache/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/christianpardillolaursen/.local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/christianpardillolaursen/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/christianpardillolaursen/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/christianpardillolaursen/.local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Android SDK
export ANDROID_HOME="$HOME/.local/Android/Sdk"
export PATH="$PATH":"$ANDROID_HOME/cmdline-tools/latest/bin":"$ANDROID_HOME/platform-tools"
