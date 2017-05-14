HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory beep nomatch
unsetopt autocd extendedglob
bindkey -e

autoload -Uz compinit promptinit
compinit
promptinit
prompt redhat

# alias
alias ls="ls --color=auto"
alias tmux="tmux -2"
alias pacaur="pacaur --aur"
