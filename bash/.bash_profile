eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

alias ls="/opt/homebrew/opt/coreutils/libexec/gnubin/ls"


source ~/.config/bash/.bashrc

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home
export JAVA_HOME=/opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home

export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="/opt/homebrew/opt/dotnet@8/bin:$PATH"
