#!/usr/bin/env zsh

# Log Helper
_info()    { echo -e "\033[1m[INFO]\033[0m $1" ; }
_ok()      { echo -e "\033[32m[OK]\033[0m $1" ; }
_error()   { echo -e "\033[31m[ERROR]\033[0m $1" ; }

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing sudo time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

_info "Updating macOS..."

_info "Checking if system is a mac..."
if [[ $(uname) != 'Darwin' ]]; then
  _error "This doesn’t seem to be a mac." && exit
else
  _ok
fi

_info "Installing updates..."
sudo softwareupdate -ia --verbose && _ok "macOS updates installed."

_info "Checking for xcode..."
if test ! "$(xcode-select -p)"; then
  xcode-select --install && _ok "installed Xcode Command Line Tools"
else
  _ok "already installed"
fi

_info "Checking for Homebrew..."
if test ! "$(which brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && _info "Homebrew installed."
else
  _ok "already installed"
fi