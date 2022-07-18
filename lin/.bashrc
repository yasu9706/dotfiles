# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/paradox.omp.json)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# カスタムプロンプト用
PLAIN='0'
BALD='1'
ITALIC='3'
UNDERLINE='4'

FG_BLACK='30'
FG_RED='31'
FG_GREEN='32'
FG_YELLOW='33'
FG_BLUE='34'
FG_MAGENTA='35'    # purple
FG_CYAN='36'       # light blue
FG_WHITE='37'
FG_DEFAULT='39'

FG_BLACK_BRIGHT='90'
FG_RED_BRIGHT='91'
FG_GREEN_BRIGHT='92'
FG_YELLOW_BRIGHT='93'
FG_BLUE_BRIGHT='94'
FG_MAGENTA_BRIGHT='95'    # purple
FG_CYAN_BRIGHT='96'       # light blue
FG_WHITE_BRIGHT='97'

BG_BLACK='40m'
BG_RED='41m'
BG_GREEN='42m'
BG_YELLOW='44m'
BG_BLUE='44m'
BG_MAGENTA='45m'
BG_CYAN='46m'
BG_WHITE='47m'
BG_DEFAULT='49m'

BG_BLACK_BRIGHT='100m'
BG_RED_BRIGHT='101m'
BG_GREEN_BRIGHT='102m'
BG_YELLOW_BRIGHT='104m'
BG_BLUE_BRIGHT='104m'
BG_MAGENTA_BRIGHT='105m'
BG_CYAN_BRIGHT='106m'
BG_WHITE_BRIGHT='107m'

## username and hostname
PS1="\[\e[$FG_BLACK;$BG_WHITE_BRIGHT\] \u@\H "

## working directory
PS1+="\[\e[$FG_WHITE_BRIGHT;$BG_MAGENTA\] \w "

## prompt
PS1+="\[\e[$FG_MAGENTA;$BG_DEFAULT\]\[\e[$FG_DEFAULT;$BG_DEFAULT\]\n\$ "

export PS1

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
TODAY=`date +%m%d`
if [ ! -e ~/user/Dropbox/$TODAY.md ]; then
    echo "# $TODAY" > ~/user/Dropbox/$TODAY.md
fi

#history format
HISTTIMEFORMAT="%Y/%m/%d(%a) %T "
