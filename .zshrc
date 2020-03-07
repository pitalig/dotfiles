# Path to oh-my-zsh installation:
export ZSH=$HOME/.oh-my-zsh

# Theme:
ZSH_THEME="gabrielpitali"
DEFAULT_USER="gabriel"

# oh-my-zsh preferences:
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

# editor
export EDITOR=vim

# Plugins:
plugins=(git lein jsontools zsh-autosuggestions)

start=`date +%s.%N`

source $ZSH/oh-my-zsh.sh

end=`date +%s.%N`
runtime=$((end-start))
echo "oh-my-zsh start time:" $runtime
start=`date +%s.%N`

# Node / nvm
source /usr/share/nvm/init-nvm.sh

end=`date +%s.%N`
runtime=$((end-start))
echo "nvm start time:" $runtime
start=`date +%s.%N`

# j
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
echo "j, fzf and some other things time:" $runtime
start=`date +%s.%N`

# >>> conda initialize >>>
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
echo "conda time:" $runtime
start=`date +%s.%N`

# Nubank setup (TODO: Move everthing after this to .nurc)
source /home/gabrielpitali/.nurc

end=`date +%s.%N`
runtime=$((end-start))
echo ".nurc load time:" $runtime
start=`date +%s.%N`

export PATH="/usr/local/bin:$PATH"
autoload bashcompinit && bashcompinit
source "$NU_HOME/nucli/nu.bashcompletion"

end=`date +%s.%N`
runtime=$((end-start))
echo "nu bash completion load time:" $runtime
start=`date +%s.%N`

# Ruby gems path
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
PATH="$GEM_HOME/bin:$PATH"

end=`date +%s.%N`
runtime=$((end-start))
echo "Ruby gems load time:" $runtime
start=`date +%s.%N`

# Aliases
alias zshconfig="code ~/.zshrc"
alias copy="xclip -selection clipboard"
alias oath_aws="ykman oath code | grep Amazon | awk '{print \$4}' | copy"
alias oath_mailchimp="ykman oath code | grep mailchimp | awk '{print \$2}' | copy"
alias oath_slack="ykman oath code | grep Slack | awk '{print \$2}' | copy"
alias gmcsg="gcmsg"
alias nu_squad_services="sh /home/gabrielpitali/dev/nu/pitali-playground/nu-squad-services.sh"
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
echo "aliases and functions load time:" $runtime
start=`date +%s.%N`
