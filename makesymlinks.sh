#!/bin/bash
# Setup script heavily inpired by https://github.com/paulirish/dotfiles/blob/main/symlink-setup.sh
SCRIPT_NAME=$(basename "$0")
declare SUCCESS_COLOR="\033[32m"
declare ERROR_COLOR="\033[31m"
declare QUESTION_COLOR="\033[33m"
declare INFO_COLOR="\033[35m"
declare NOCOLOR="\033[0m"
declare -a FILESTOIGNORE=(
    $SCRIPT_NAME
    .git
    setup.sh
    bootstrap.sh
    README.md
    LICENSE
    run-sync.sh
    brewfile-sync.sh
)

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

function ask_for_confirmation() {
    print_question "${1} (y/n)"
    read -n 1
    echo
}

function answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

function create_symlinks() {
    local DOTFILES=$(find . -type f -maxdepth 1 -name "*" $(printf " -not -name %s" "${FILESTOIGNORE[@]}") | sed -e 's|./||')
    for file in $DOTFILES
    do
        source_path="$(pwd)/$file"
        target_path="$HOME/$file"
        if  [ ! -f $target_path ]; then
            ln -s -f $source_path $target_path
            if [ $? -eq 0 ]; then
                print_success "Symlinked $file → $target_path"
            else
                print_error "Failed to symlink $file → $target_path"
            fi 
        else
            if [ -L $target_path ]; then
                ln -s -f $source_path $target_path
                if [ $? -eq 0 ]; then
                    print_success "Symlink $target_path replaced"
                else
                    print_error "Failed to replace symlink $source_path → $target_path "
                fi 
                continue
            fi
            ask_for_confirmation "Do you want to replace ${target_path} with symlink"
            if answer_is_yes; then
                rm $target_path
                ln -s -f $source_path $target_path
                if [ $? -eq 0 ]; then
                    print_success "Symlinked $file → $target_path"
                else
                    print_error "Failed to symlink $source_path → $target_path"
                fi 
            else
                print_info "Skipping symlinking $target_path ..."
            fi
        fi
    done
}

create_symlinks