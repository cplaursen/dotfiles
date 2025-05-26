#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:/home/christianpardillolaursen/.local/bin/:/home/christianpardillolaursen/.local/bin/i3cmds:/home/christianpardillolaursen/.local/bin/tools"
export L4V_ARCH=X64
export EDITOR="nvim"
export TERMINAL="kitty"
export READER="zathura"
export FILE="lf"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export MOZ_ENABLE_WAYLAND=1

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# change ackrc location
export ACKRC="$HOME/.config/ackrc"

mpd >/dev/null 2>&1 &

[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

xset r rate 220 40

export PATH="$HOME/.elan/bin:$PATH"

if [ -e /home/christianpardillolaursen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/christianpardillolaursen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# opam configuration
test -r /home/christianpardillolaursen/.opam/opam-init/init.sh && . /home/christianpardillolaursen/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
. "$HOME/.cargo/env"

# >>> coursier install directory >>>
export PATH="$PATH:/home/christianpardillolaursen/.local/share/coursier/bin"
# <<< coursier install directory <<<
