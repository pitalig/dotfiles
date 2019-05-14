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

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh
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

# Nubank setup (TODO: Move everthing after this to .nurc)
source /home/gabrielpitali/.nurc
export PATH="/usr/local/bin:$PATH"
autoload bashcompinit && bashcompinit
source "$NU_HOME/nucli/nu.bashcompletion"

# Ruby gems path
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
PATH="$GEM_HOME/bin:$PATH"
