# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="theunraveler"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    cabal
    git
    stack
    vi-mode
    z
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.xmonad/bin:$HOME/.xmonad/bin:$HOME/.cask/bin:$PATH"

function r {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

ghosts 

source /home/chris/.config/broot/launcher/bash/br
