#!/bin/bash
declare SUCCESS_COLOR="\033[32m"
declare ERROR_COLOR="\033[31m"
declare QUESTION_COLOR="\033[33m"
declare INFO_COLOR="\033[35m"
declare NOCOLOR="\033[0m"


function print_success() {
    echo -e "$SUCCESS_COLOR${1} [✔]$NOCOLOR"
}

function print_error() {
    echo -e "$ERROR_COLOR$1 [✖]$NOCOLOR"
}

function print_question() {
    echo -e "$QUESTION_COLOR$1 [?]$NOCOLOR"
} 

function print_info() {
    echo -e "$INFO_COLOR$1$NOCOLOR"
}


platform=$(uname)

# Install Oh My ZSH
# https://ohmyz.sh/#install
print_info "Installing Oh-My-ZSH..."
if command -v curl &> /dev/null; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

# Hush login on terminal start in Mac OS
if [[ $platform == 'Darwin' ]]; then
    touch $HOME/.hushlogin
    print_success "Login prompt hushed..."
fi

# Creating symlinks
./makesymlinks.sh

# Running brew bundle
if [[ $platform == 'Darwin' ]]; then
    if ! command -v brew &> /dev/null; then
        print_info "Homebrew not found. Installing..."
        # Installation instructions are here https://brew.sh/
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi 
    print_info "Installing packages from Brewfile"
    brew bundle --file="$HOME/Brewfile"
fi

print_success "Setup complete."