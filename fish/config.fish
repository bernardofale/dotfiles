
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/bernardo/miniconda/bin/conda
    eval /Users/bernardo/miniconda/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/bernardo/miniconda/etc/fish/conf.d/conda.fish"
        . "/Users/bernardo/miniconda/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/bernardo/miniconda/bin" $PATH
    end
end
# <<< conda initialize <<<

