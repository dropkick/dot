#!/usr/bin/env zsh

# Log Helper
_info()    { echo -e "\033[1m[INFO]\033[0m $1" ; }
_ok()      { echo -e "\033[32m[OK]\033[0m $1" ; }
_error()   { echo -e "\033[31m[ERROR]\033[0m $1" ; }

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# npm                                                                         #
###############################################################################
_info "Installing npm packages..."
npm install -g @angular/cli || _error "failed npm install @angular/cli"
npm install -g fkill-cli || _error "failed npm install fkill-cli"
npm install -g typescript || _error "failed npm install typescript"


###############################################################################
# Homebrew                                                                    #
###############################################################################
_info "<<< Starting Homebrew Setup >>>"

if exists brew; then
  _ok "brew exists, moving on"
else 
  _ok "brew does not exist. Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# TODO: Keep an eye out for a different `--no-quarantine` solution.
# Currently, you can't do `brew bundle --no-quarantine` as an option.
# It's currently exported in zshrc:
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474

brew bundle --verbose