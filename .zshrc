# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(
	git
	poetry
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
export PATH="$HOME/.deta/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# Pyenv configuration
eval "$(pyenv init --path)"

# Poetry configuration
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias ls="exa --icons"
alias la="exa --icons --long --all"
alias tree="exa --tree --level=2"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
# Completions for pipx
eval "$(register-python-argcomplete pipx)"
