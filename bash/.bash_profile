eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

alias ls="/opt/homebrew/opt/coreutils/libexec/gnubin/ls"


source ~/.bashrc

