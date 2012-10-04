# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="andrew"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

unsetopt correctall
setopt glob_complete
setopt auto_pushd
setopt pushd_minus
setopt pushd_silent
setopt NO_FLOW_CONTROL
setopt NO_BEEP
setopt numeric_glob_sort

# If I am using vi keys, I want to know what mode I'm currently using.
# zle-keymap-select is executed every time KEYMAP changes.
# From http://zshwiki.org/home/examples/zlewidgets
#function zle-keymap-select {
    #VIMODE="${${KEYMAP/vicmd/ M:command}/(main|viins)/}"
    #echo "$VIMODE"
    #zle reset-prompt
#}

#zle -N zle-keymap-select

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _approximate _ignored
# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'
# more errors allowed for large words and fewer for small words
zstyle ':completion:*:approximate:*' max-errors 'reply=(  $((  ($#PREFIX+$#SUFFIX)/3  ))  )'
# Don't complete directory we are already in (../here)
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::approximate*:*' prefix-needed false

# Where it gets saved
HISTFILE=~/.history
# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000
# Don't overwrite, append!
setopt APPEND_HISTORY
# Write after each command
setopt INC_APPEND_HISTORY
# Killer: share history between multiple shells
setopt SHARE_HISTORY
# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

DEFAULT_USER=andrew

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby gem python pip rails rails3 rake)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

alias get="sudo apt-get install"
alias gemget="sudo gem install"
alias g="sudo apt-get install"
alias p="python"
alias manage="python manage.py"
alias f="find / -name"
alias process="ps -ef | grep"
alias mk="./configure; make; make install"
alias readme="cat readme* README* Readme* | less"
alias exut=exit
alias exi=exit
alias exot=exit
alias eixt=exit
alias overtone="lein repl"
alias watchcoffee="coffee --watch -c -o ../js *.coffee"
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

export PATH=$PATH:/home/andrew/scripts

xset b off
xset b 0 0 0

xmodmap -e "clear lock"
xmodmap -e "keycode 0x42 = Escape"
xmodmap -e "keycode 118 = BackSpace"

# export TERM="xterm-256color"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias usage="du -chs * | sort -h"
