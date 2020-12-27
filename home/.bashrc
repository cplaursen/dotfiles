#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 6)\][\[$(tput setaf 4)\]\u \[$(tput setaf 5)\]\W\[$(tput setaf 6)\]]\[$(tput setaf 7)\$(git_branch)\]\\$ \[$(tput sgr0)\]"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

function l {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
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

source /home/chris/.config/broot/launcher/bash/br
export MORSE_BLENDER=~/Documents/morse/blender/blender

# opam configuration
test -r /home/chris/.opam/opam-init/init.sh && . /home/chris/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
