eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

alias ls="/opt/homebrew/opt/coreutils/libexec/gnubin/ls"


source ~/.config/bash/.bashrc

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home
export JAVA_HOME=/opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bernardo/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bernardo/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/bernardo/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bernardo/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
