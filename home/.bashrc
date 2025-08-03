[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=500
HISTFILESIZE=0

shopt -s checkwinsize

# ** for matching all files and zero or more directioes and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\[\e[1;34m\]\w\[\e[m\] '

alias v='vim'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -l'
alias la='ls -A'
alias lx='ls --color=never'

alias dl='cd ~/dl; ls'
alias shut='sudo poweroff; exit'
alias rebo='sudo reboot; exit'

alias update='sudo xbps-install -Su'
alias inst='sudo xbps-install'

alias cb='xclip -selection clipboard'

alias procs='ps -aux'

alias ?='which'
alias ..='cd ..'

instf() {
	if [ -f "$1" ]; then
		sudo xbps-install $(< $1)
	else
		echo "$1 is not a file!"
	fi
}

export PATH="$HOME/script:$HOME/.local/bin:$PATH"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#. "$HOME/.cargo/env"
