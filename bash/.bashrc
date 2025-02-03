eval "$(/opt/homebrew/bin/brew shellenv)"

PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\[\e[38;5;1;1;3m\]\u\[\e[0m\]@\[\e[38;5;19;38;5;1;1m\]\h\[\e[0m\] \[\e[38;5;2m\]\w\[\e[0m\] \[\e[38;5;77m\]${PS1_CMD1}\[\e[0m\] '


# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

. "$HOME/.cargo/env"
