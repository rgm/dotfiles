fpath=(/usr/local/share/zsh-completions $fpath) # https://github.com/zsh-users/zsh-completions
cdpath=($HOME/Projects/stage3 $HOME/Projects/resolve/github $HOME/Projects)

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

setopt DVORAK

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.5

# nvm
# export NVM_DIR="/Users/rgm/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# nvm use stable

# direnv
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
alias em="emacsclient"

# command line editing
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey "^XE" edit-command-line
# bindkey -M vicmd v edit-command-line

bindkey -e

# z autojumpishness
# see https://github.com/junegunn/fzf/wiki/Examples#z
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh
unalias z
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

. $HOME/.zsh/plugins/bd/bd.zsh

autoload -U promptinit; promptinit
prompt pure

export PATH=$HOME/bin:$PATH

function dt () {
  echo -e "\033]50;SetProfile=light\a"; export ITERM_PROFILE=light;
}

function nt () {
  echo -e "\033]50;SetProfile=dark\a"; export ITERM_PROFILE=dark;
}

# eval $(op signin my)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
