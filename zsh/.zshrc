HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
unsetopt autocd extendedglob nomatch beep

# emacs mode
bindkey -e

autoload -Uz compinit vcs_info
compinit

# git prompt
source ~/.zsh/.git-prompt.sh
setopt prompt_subst
PROMPT=$'%F{green}%n@%m%f %F{yellow}%B%~%b%f\ %F{cyan}$(__git_ps1 "(%s)")%f
%(!.#.$) '
RPROMPT=$''
zstyle ':vcs_info:git:*' formats '(%b)'

# alias
alias ls="ls --color=auto"
alias tmux="tmux -2"
alias pclear='sudo pacman -Rsn $(pacman -Qdtq)'
alias vim='nvim'

# start ssh-agent
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env
# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
fi
unset env

fpath=(~/.zsh $fpath)

if [[ -f ~/.zshrc.local && -r ~/.zshrc.local ]]; then
   source ~/.zshrc.local
fi

