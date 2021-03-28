echo 'Hello from .zshrc'


# Set Variables


# Change ZSH Options


# Create Aliases

alias lls='ls -lAhF'


# Customize Prompt(s)
PROMPT='
%n@%m %1~ %L %# '

RPROMPT='%*'

# Add Locations to $PATH  Variable


# Write Handy Functions

function mkcd {
  mkdir -p "$@" && cd "$_" 
}


# Use ZSH Plugins






