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

# Hush login on terminal start in Mac OS
if [[ $platform == 'Darwin' ]]; then
    touch $HOME/.hushlogin
    print_success "Login prompt hushed..."
fi

./makesymlinks.sh