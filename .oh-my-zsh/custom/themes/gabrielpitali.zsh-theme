PROMPT='$fg_bold[blue][ $fg[white]conda: $fg[red]$CONDA_DEFAULT_ENV $fg_bold[blue]] $fg_bold[blue][ $fg[white]aws: $fg[red]$AWS_DEFAULT_PROFILE $fg_bold[blue]] $fg_bold[blue][ $fg[red]%* $fg_bold[blue]] $fg_bold[blue] [ %~$(git_prompt_info)$fg_bold[blue] ]$reset_color
$ '
# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[green]("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY="✗"
