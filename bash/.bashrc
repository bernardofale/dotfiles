eval "$(/opt/homebrew/bin/brew shellenv)"

PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\[\e[38;5;1;1;3m\]\u\[\e[0m\]@\[\e[38;5;19;38;5;1;1m\]\h\[\e[0m\] \[\e[38;5;2m\]\w\[\e[0m\] ${PS1_CMD1}'

