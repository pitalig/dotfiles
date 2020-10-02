# Path to oh-my-zsh installation:
export ZSH=$HOME/.oh-my-zsh

# Theme:
ZSH_THEME="gabrielpitali"
DEFAULT_USER="gabriel"

# oh-my-zsh preferences:
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

# history options
export HISTSIZE=100000
export SAVEHIST=100000
setopt HIST_FIND_NO_DUPS
setopt inc_append_history
setopt share_history

# editor
export EDITOR=vim

# Plugins:
plugins=(git lein jsontools flutter)

# Load oh-my-zsh
start=`date +%s.%N`

source $ZSH/oh-my-zsh.sh

end=`date +%s.%N`
runtime=$((end-start))
echo "oh-my-zsh start time:" $runtime

# j
start=`date +%s.%N`
source /etc/profile.d/autojump.zsh

#fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_COMPLETION_TRIGGER='**'
bindkey '^T' fzf-completion

# Disable correction suggestions
unsetopt correct_all

# Tilix error fix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Export slack token for matricula bot
export slack_token=""

end=`date +%s.%N`
runtime=$((end-start))
echo "j, fzf and some other things start time:" $runtime

# >>> conda initialize >>>
start=`date +%s.%N`

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($HOME'/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

end=`date +%s.%N`
runtime=$((end-start))
echo "conda start time:" $runtime

# Aliases
start=`date +%s.%N`

alias zshconfig="code ~/.zshrc"
alias copy="xclip -selection clipboard"
alias oath_aws="ykman oath code | grep Amazon | awk '{print \$4}' | copy"
alias oath_mailchimp="ykman oath code | grep mailchimp | awk '{print \$2}' | copy"
alias oath_slack="ykman oath code | grep Slack | awk '{print \$2}' | copy"
alias gmcsg="gcmsg"
alias lint="lein lint-fix && git add . && gcmsg \"lint-fix\" && ggp"

# Functions
function mkdate
{
    mkdir "$(date '+%Y_%m_%d')_$1"
}

function touchdate
{
    touch "$(date '+%Y_%m_%d')_$1"
}

end=`date +%s.%N`
runtime=$((end-start))
echo "aliases and functions start time:" $runtime

# Source things specific for nu laptop
start=`date +%s.%N`
pc_name=`uname -n`
if [ $pc_name = "gabrielpitali-pc" ]; then
    echo "nulaptoprc:"
    source /home/gabrielpitali/.nulaptoprc

    end=`date +%s.%N`
    runtime=$((end-start))
    echo "nulaptoprc start time:" $runtime
fi
