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
chruby 2.6

# nvm
export NVM_DIR="/Users/rgm/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
#   elif [[ $(nvm version) != $(nvm version default)  ]]; then
#     echo "Reverting to nvm default version"
#     nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# jenv
export PATH=”$HOME/.jenv/bin:$PATH”
eval "$(jenv init -)"

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

# source highlighting
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -g -i -J --underline-special --SILENT'

alias g="git status"
alias ls="gls --color --classify --ignore-backups -v"
alias l="ls -l"
alias ll="ls -la"
alias em="emacsclient"
alias t="tree -I node_modules"

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

function sl () {
  echo -e "\033]50;SetProfile=solarized-light\a"; export ITERM_PROFILE=solarized-light;
}

function sd () {
  echo -e "\033]50;SetProfile=solarized-dark\a"; export ITERM_PROFILE=solarized-dark;
}

# eval $(op signin my)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vault autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rgm/bin/vault vault

export PATH="$HOME/.cargo/bin:$PATH"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude node_modules --exclude .git"
export FZF_ALT_C_COMMAND="fd --type d . ~/Projects"

eval "$(pyenv init -)"
