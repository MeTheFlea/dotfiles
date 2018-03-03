HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory beep nomatch
unsetopt autocd extendedglob
bindkey -e

autoload -Uz compinit vcs_info
compinit

# git prompt
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT=$'%F{green}%n@%m%f %F{yellow}%B%~%b%f\ %F{cyan}$vcs_info_msg_0_%f
%# '
zstyle ':vcs_info:git:*' formats '(%b)'

# alias
alias ls="ls --color=auto"
alias tmux="tmux -2"
alias pacaur="pacaur --aur"
