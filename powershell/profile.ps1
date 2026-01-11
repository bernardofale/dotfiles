
#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "/Users/bernardo/miniconda/bin/conda") {
    (& "/Users/bernardo/miniconda/bin/conda" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}
#endregion

