# echo 'Hello from .zshrc'

# neofetch

# Set Variables

# Syntax highlighting for man pages using bat
# (set bat as a colorizing pager for man, by setting the MANPAGER variable)
# export MANPAGER="sh -c 'col -bx | bat -l man -p'" # replaced with batman command in bat-extras


# Sidestep macOS Gatekeeper for cask installs 
export HOMEBREW_CASK_OPTS="--no-quarantine"


# Change ZSH Options

# Create Aliases

# alias lls='ls -lAFh'
# alias ls='exa -laFh --git'
# alias exa='exa -laFh --git'
# alias man='batman' # replace standard man pager with batman in bat-extras

source $HOME/.dot/config/zsh/alias.zsh

# Customize Prompt(s)
# PROMPT='
# %n@%m %1~ %L %# '

# PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
# RPROMPT='%*'
# PROMPT="%n@%M %~"

PROMPT='%F{blue}%*%f:%F{green}%~%f %# '
RPROMPT="%F{245}%T %D{%a %b %d} %f"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '[%b%u%c]'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '
# RPROMPT= \$vcs_info_msg_0_

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %F{245}%n%f%F{240}@%f%F{245}%m%f %B%F{39}%1~%f%b %F{118}${vcs_info_msg_0_}
%F{229}%#%f '

# Initialize zsh-autosuggestions
# source #{HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add Locations to $PATH  Variable

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# Write Handy Functions

function mkcd {
  mkdir -p "$@" && cd "$_" 
}

# Update packages and pkg managers (OS, brew, npm, gem)
function update {
  sudo softwareupdate -i -a
  brew update
  brew upgrade
  npm install npm -g
  npm update -g
  gem update --system
  gem update
}


