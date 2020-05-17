export EDITOR=nvim

fpath=(.zsh/completions /usr/local/share/zsh-completions $fpath) # https://github.com/zsh-users/zsh-completions
cdpath=($HOME/Projects/opengb $HOME/Projects/vectorworks $HOME/Projects)

export PATH=$HOME/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$HOME/.nodes/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=”$HOME/.jenv/bin:$PATH”

export TZ=UTC # for prompt time in UTC

# vi:ft=zsh
