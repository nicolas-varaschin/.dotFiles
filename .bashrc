# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls -al --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi


function cdd { cd "${1}";ls;}
alias cd='cdd'
alias d1='cd /media/sda1/'
alias d2='cd /media/sda2/'
alias inst='sudo apt-get install'
alias colorearBash='PS1="[\[\033[32m\]\W]\[\033[0m\]\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"'
alias search='aptitude search'
alias nota='cat >>'
alias servir='python -m SimpleHTTPServer 31416'
alias Ip='curl http://automation.whatismyip.com/n09230945.asp && echo'

source ~/git-prompt.sh
PS1="[\[\033[32m\]\W]\[\033[0m\]\[\033[1;36m\]\u\[\033[1;31m\] $(__git_ps1 "(%s)")\[\033[1;33m\]-> \[\033[0m\]"

# some more ls aliases
alias ll='ls -l'
alias espacio='df -h | grep home'
alias la='ls -A'
#alias l='ls -CF'
alias cdpl='cd ~/trunk/platform'
alias gti='git'
alias cdcue='cd ~/trunk/cue'
alias cdreg='cd ~/trunk/reglas-moderacion'
alias mvns='mvn -P spec-developer eclipse:eclipse -Dmaven.test.skip=true'
alias mvne='mvn eclipse:eclipse'
alias planilla='cd /home/nicolas/trunk/meli_items/Planillas > /dev/null; svn up; cd - > /dev/null'
alias reglas='cd /home/nicolas/trunk/reglas-moderacion > /dev/null; svn up; cd - > /dev/null'
alias pgrestart='sudo /etc/init.d/postgresql restart'
alias pgstart='sudo /etc/init.d/postgresql start'
alias verlog='tail -n1000 /var/log/postgresql/postgresql-9.1-main.log'
export HISTSIZE=10000
export HISTCONTROL=erasedups
shopt -s histappend

function calc
{
echo "${1}" | bc -l;
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi



PATH=$PATH:/usr/share/ruby-rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#[[ -s "/home/nicolas/.rvm/scripts/rvm" ]] && source "/home/nicolas/.rvm/scripts/rvm"

# Bash completion
# if [ -f /etc/bash_completion ]; then
# . /etc/bash_completion
# fi
# export GIT_PS1_SHOWDIRTYSTATE=1

# export PS1='[\[\033[32m\]\W]\[\033[0m\]\[\033[1;36m\]\u\[\033[1;33m\]$(__git_ps1)\[\033[01;34m\] -> \[\033[0m\]'
PATH=$PATH:/opt/freeling-3.0/bin
PATH=$PATH:$HOME/clion/bin
if [ "x$TERM" = "xxterm" ]
then
	    export TERM="xterm-256color"
fi
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/lib
export GIT_EDITOR="subl --wait"

export NVM_DIR="/home/nico/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
