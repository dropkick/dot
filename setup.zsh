#!/usr/bin/env zsh

# Log Helper
info() { echo -e "\033[1m[INFO]\033[0m $1" ; }
ok()   { echo -e "\033[32m[OK]\033[0m $1" ; }

function runScripts() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ "$ARG" == "init" ] || [ "$ARG" == "all" ]; then
            info "💥 Starting init.zsh script..."
            ./scripts/setup/init.zsh
        fi
        if [ "$ARG" == "packages" ] || [ "$ARG" == "all" ]; then
            info "📦 Starting install_packages.zsh script..."
            ./scripts/setup/install_packages.zsh
        fi
        if [ "$ARG" == "macos" ] || [ "$ARG" == "all" ]; then
            info "🍎 Starting macos.zsh script..."
            ./scripts/setup/macos.zsh
        fi
        if [ "$ARG" == "config" ] || [ "$ARG" == "all" ]; then
            info "🚦 Starting config.zsh script..."
            ./scripts/setup/config.zsh
        fi
    done
    ok "Setup scripts complete."
    info "This is a good time for a reboot."
}

read -r -p "This script will do things. Many things. Are you sure you want these things done? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    runScripts "$@"
fi;

unset runScripts;
