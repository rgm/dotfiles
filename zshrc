# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

eval "$(/opt/homebrew/bin/brew shellenv)"

autoload zmv
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# direnv
eval "$(direnv hook zsh)"

# jenv
eval "$(jenv init --no-rehash -)"

# chruby
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh
# chruby 2.6


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
bindkey -v # vi keybindings
# bindkey -e # emacs keybindings


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
alias grcd='cd $(git root)'
alias csv=mlr
alias G="git"
alias e="nvim"
alias v="nvim -R"


gfu() {
  git commit --amend --no-edit
}
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

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

1password() {
  eval $(op signin opengb)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude node_modules --exclude .git"
export FZF_ALT_C_COMMAND="fd --type d . ~/Projects"

eval "$(pyenv init -)"

# basecamp/sub-like stuff

# eval "$($HOME/Projects/tiny/tentacles/tnt/bin/tnt init -)"
# eval "$($HOME/bin/tome init fluid ~/Projects/human-studio/repos/fluid/scripts $0)"

autoload -U promptinit; promptinit

# vault autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rgm/bin/vault vault

# z autojumpishness
# see https://github.com/junegunn/fzf/wiki/Examples#z
[ -f $HOME/Projects/dotfiles/z.sh ] && . $HOME/Projects/dotfiles/z.sh
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


eval "$(pyenv init --path)"

# fish-like autosuggest
# https://github.com/zsh-users/zsh-autosuggestions
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# export ZSH_AUTOSUGGEST_USE_ASYNC=1

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/rgm/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# vi:ft=zsh
