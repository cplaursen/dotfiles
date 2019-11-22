#!/bin/sh

~/.screenlayout/layout.sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec i3
