echo 'Hello from .zshrc'


# Set Variables

# Syntax highlighting for man pages using bat
# (set bat as a colorizing pager for man, by setting the MANPAGER variable)
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Sidestep macOS Gatekeeper for cask installs 
export HOMEBREW_CASK_OPTS="--no-quarantine"


# Change ZSH Options


# Create Aliases

alias lls='ls -lAFh'


# Customize Prompt(s)
PROMPT='
%n@%m %1~ %L %# '

RPROMPT='%*'

# Add Locations to $PATH  Variable

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# Write Handy Functions

function mkcd {
  mkdir -p "$@" && cd "$_" 
}


# Use ZSH Plugins
