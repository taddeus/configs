# ~/.bashrc: executed by bash(1) for non-login shells.

#
# Bash history and shell options
#

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#
# Setting PS1
#

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# comment for uncolored terminal
color_prompt=yes

if [ $UID -eq 0 ]; then
    USERCOLOR="\[\e[01;31m\]"  # Red if running as root
    INDICATOR="#"
else
    USERCOLOR="\[\e[01;32m\]"  # Green otherwise
    INDICATOR="$"
fi

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}$USERCOLOR\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$INDICATOR "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$INDICATOR '
fi
unset color_prompt

#
# Aliases
#

# enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_OPTIONS="--color=auto"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls shortcuts
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -lFh'

# ssh shortcuts for multivac
alias smv='ssh mv -tt screen -Uxr'
alias smx='ssh mvx -tt screen -Uxr'
alias mvv='mosh mv -p 8051 -- screen -Uxr'

# more alias fancyness
alias cdhere='cd $(realpath $(pwd))'
alias ocaml='rlwrap ocaml'
alias c='xclip -i -selection clipboard'
alias vimdiff='vim -d -c "colorscheme desert"'
alias ydiff='diff -y -W 196 --left-column'
alias v='gpicview'
alias avg="awk '{a+=\$1} END{print a/NR}'"
alias json='python -mjson.tool'
alias g='grep'
alias h='help'

# git shortcuts
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gr='git pull --rebase'
alias grr='git pull --rebase --recurse-submodules'
alias m='make'

# apt shortcuts
alias apt='sudo apt'
alias api='apt install'
alias aps='\apt search'

tm () {
    `which time` -f %e $* > /dev/null
}

mkc() {
    mkdir -p "$@" && cd "$@"
}

# Run objdump on a file, open in vim with syntax highlighting
dis() {
    if [ ! -f "$1" ]; then
        echo "dis: file '$1' does not exist"
        return
    fi
    objdump -d $1 | vim -R - "+set ft=dis"
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# syntax-highlighted cat
alias pcat="pygmentize -f terminal256 -O style=native -g"
pless() {
    pcat "$@" | less -r
}

#
# Environment
#

export TERM="xterm-256color"

#export LC_ALL="en_US.UTF-8"
#export LANG="$LC_ALL"

export EDITOR=vim

export PATH=$HOME/.local/bin:$PATH:/sbin:/usr/sbin

#
# local, installation-specific config
#

[ -f ~/.bashrc_local ] && . ~/.bashrc_local
