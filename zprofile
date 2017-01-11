source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
eval "$(direnv hook zsh)"

export EDITOR=vim

# uncomment to reinstall completions
# autoload -U compinstall
# compinstall
#
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*'
zstyle :compinstall filename '/Users/rgm/.zprofile'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias g="git status"
alias ls="gls --color --classify --ignore-backups"
alias l="ls -l"
alias ll="ls -la"
