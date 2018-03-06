HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory beep nomatch
unsetopt autocd extendedglob
bindkey -e

autoload -Uz compinit vcs_info
compinit

# git prompt
source ~/.git-prompt.sh
setopt prompt_subst
PROMPT=$'%F{green}%n@%m%f %F{yellow}%B%~%b%f\ %F{cyan}$(__git_ps1 "(%s)")%f
%# '
zstyle ':vcs_info:git:*' formats '(%b)'

# alias
alias ls="ls --color=auto"
alias tmux="tmux -2"
alias pacaur="pacaur --aur"
