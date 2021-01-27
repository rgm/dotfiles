# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload zmv
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# jenv
eval "$(jenv init -)"

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.6

# direnv
eval "$(direnv hook zsh)"

# n - node changer-upper
export N_PREFIX=$HOME/.nodes

# source highlighting
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# command line editing
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey "^XE" edit-command-line
# bindkey -M vicmd v edit-command-line

bindkey -e


# uncomment to reinstall completions
# autoload -U compinstall
# compinstall

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*'
zstyle :compinstall filename '/Users/rgm/.zprofile'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias less='less -m -g -i -J --underline-special --SILENT'
alias g="git status"
alias ls="gls --color --classify --ignore-backups -v"
alias l="ls -l"
alias ll="ls -la"
alias em="emacsclient"
alias t="tree -I node_modules"
alias cloc=tokei

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function dt () {
  echo -e "\033]50;SetProfile=github\a"; export ITERM_PROFILE=github;
}

function nt () {
  echo -e "\033]50;SetProfile=molokai\a"; export ITERM_PROFILE=molokai;
}

function sl () {
  echo -e "\033]50;SetProfile=solarized-light\a"; export ITERM_PROFILE=solarized-light;
}

function sd () {
  echo -e "\033]50;SetProfile=solarized-dark\a"; export ITERM_PROFILE=solarized-dark;
}

. $HOME/.zsh/plugins/bd/bd.zsh

# eval $(op signin my)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude node_modules --exclude .git"
export FZF_ALT_C_COMMAND="fd --type d . ~/Projects"

eval "$(pyenv init -)"
eval "$($HOME/Projects/tiny/tentacles/tnt/bin/tnt init -)"


autoload -U promptinit; promptinit

# vault autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rgm/bin/vault vault

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

# fish-like autosuggest
# https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# vi:ft=zsh
