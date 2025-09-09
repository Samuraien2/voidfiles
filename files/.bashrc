[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s globstar
shopt -s checkwinsize

HISTSIZE=500
HISTFILESIZE=500
HISTFILE=~/.cache/bash_hst

PS1='\[\e[1;34m\]\w\[\e[m\] '

alias suv='sudo vim'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -l'
alias la='ls -A'
alias lx='ls --color=never'

alias dl='cd ~/dl; ls'
alias shut='sudo poweroff'
alias rebo='sudo reboot'

alias update='sudo xbps-install -Su'
alias inst='sudo xbps-install'

alias cb='xclip -selection clipboard'

alias procs='ps aux'

alias ?='which'
alias ..='cd ..'

export PATH="$HOME/bin:$PATH"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
