#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

export GPG_TTY=$(tty)

# System Maintainence
alias mw="~/.config/mutt/mutt-wizard.sh"
alias muttwizard="~/.config/mutt/mutt-wizard.sh"
alias sdn="sudo shutdown now"
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

# Some aliases
alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="nvim"
alias sv="sudo nvim"
alias r="ranger-cd"
alias sr="sudo ranger"
alias e="emacsclient"
alias ka="killall"
alias g="git"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias ref="shortcuts.sh && source ~/.bashrc" # Refresh shortcuts manually and reload bashrc
alias bw="wal -n -i ~/Images/bird.png" # Rerun pywal
alias pi="bash ~/.larbs/wizard/wizard.sh"
alias jme="bash /home/chris/jmonkeyplatform/bin/jmonkeyplatform"

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp3s0"
alias starwars="telnet towel.blinkenlights.nl"

# TeX
alias Txa="cp ~/Documents/LaTeX/article.tex"
alias Txs="cp ~/Documents/LaTeX/beamer.tex"
alias Txh="cp ~/Documents/LaTeX/handout.tex"

source ~/.shortcuts

shdl() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
source /home/chris/.shortcuts
export PATH=$PATH:~/.local/bin
export EDITOR=nvim
