# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

# Locale setup
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Geometry theme configurations
GEOMETRY_SYMBOL_PROMPT="$"                  # default prompt symbol
GEOMETRY_SYMBOL_RPROMPT=">"                 # multiline prompts
GEOMETRY_SYMBOL_EXIT_VALUE="$"              # displayed when exit value is != 0
GEOMETRY_SYMBOL_ROOT="#" 

PATH="$PATH:$HOME/.local/bin"

# Antigen loader
source "$HOME/.antigen.zsh"
antigen init "$HOME/.antigenrc"

# Zsh-autosuggestions binding key
# bindkey "^[[A" autosuggest-accept

# Pipenv configuration 
export PIPENV_VENV_IN_PROJECT=1

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Pyenv configuration
eval "$(pyenv init --path)"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias ls="exa --icons --group-directories-first"
alias la="exa --icons --long --group-directories-first --all"
alias tree="exa --tree --group-directories-first --level=2"
alias loadenv="set -o allexport; source .env; set +o allexport"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
# Activation of direnv
eval "$(direnv hook zsh)"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
