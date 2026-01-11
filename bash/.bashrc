eval "$(/opt/homebrew/bin/brew shellenv)"

PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\[\e[38;5;1;1;3m\]\u\[\e[0m\]@\[\e[38;5;19;38;5;1;1m\]\h\[\e[0m\] \[\e[38;5;2m\]\w\[\e[0m\] \[\e[38;5;77m\]${PS1_CMD1}\[\e[0m\] '

# Force bash as the shell
if [ "$0" != "/bin/bash" ] && [ "$0" != "bash" ] && [ "$0" != "-bash" ]; then
    exec /bin/bash
fi

. "$HOME/.cargo/env"
export JAVA_HOME=/opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home
export JAVA_HOME=/opt/homebrew/opt/openjdk@11
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"
