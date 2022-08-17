# copydir
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copydir
# Copies the pathname of the current directory to the system or X Windows clipboard
function copydir {
  emulate -L zsh
  print -n $PWD | clipcopy
}

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile
# Copies the contents of a given file to the system or X Windows clipboard
#
# copyfile <file>
function copyfile {
  emulate -L zsh
  clipcopy $1
}

# Log Helper
info() { echo -e "\033[1m[INFO]\033[0m $1" ; }
ok()   { echo -e "\033[32m[OK]\033[0m $1" ; }

function updates {
  ok "🚦 Let’s update all the things..."
  info "[1/7] 🍎 Starting macOS cli software update..."
  sudo softwareupdate -i -a
  ok "macOS cli softwareupdate complete"
  info "[2/7] 🍺 Starting homebrew update..."
  brew update
  ok "🍺 homebrew update complete"
  info "[3/7] 🍺 Starting homebrew upgrade..."
  brew upgrade
  ok "🍺 homebrew upgrade complete"
  # npm install npm -g
  info "[4/7] 🚦 Starting global node package update (npm update -g)..."
  npm update -g
  ok "✔ global node package update complete..."
  info "[5/7] 🚦 Starting system ruby gem updates..."
  gem update --system
  ok "✔ system ruby gem updates complete..."
  info "[6/7] 🚦 Starting gem update..."
  gem update
  ok "✔ ruby gem update complete..."
  info "[7/7] 🚦 Starting Mac App Store updates (mas)..."
  mas upgrade  
  ok "✔ Mac App Store updates complete..."
  ok "💥 all the things have been updated..."
}

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode
# VS Code (stable / insiders) / VSCodium zsh plugin
# Authors:
#   https://github.com/MarsiBarsi (original author)
#   https://github.com/babakks
#   https://github.com/SteelShot

# Verify if any manual user choice of VS Code exists first.
if [[ -n "$VSCODE" ]] && ! which $VSCODE &>/dev/null; then
  echo "'$VSCODE' flavour of VS Code not detected."
  unset VSCODE
fi

# Otherwise, try to detect a flavour of VS Code.
if [[ -z "$VSCODE" ]]; then
  if which code &>/dev/null; then
    VSCODE=code
  elif which code-insiders &>/dev/null; then
    VSCODE=code-insiders
  elif which codium &>/dev/null; then
    VSCODE=codium
  else
    return
  fi
fi

alias vsc="$VSCODE ."
alias vsca="$VSCODE --add"
alias vscd="$VSCODE --diff"
alias vscg="$VSCODE --goto"
alias vscn="$VSCODE --new-window"
alias vscr="$VSCODE --reuse-window"
alias vscw="$VSCODE --wait"
alias vscu="$VSCODE --user-data-dir"

alias vsced="$VSCODE --extensions-dir"
alias vscie="$VSCODE --install-extension"
alias vscue="$VSCODE --uninstall-extension"

alias vscv="$VSCODE --verbose"
alias vscl="$VSCODE --log"
alias vscde="$VSCODE --disable-extensions"

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/httpie
# httpie: add alias for http

alias https='http --default-scheme=https'


# Functions: network

# Webserver


srv() {
  local DIR=${1:-.}
#  local AVAILABLE_PORT=$(get-port)
#  local PORT=${2:-$AVAILABLE_PORT}
#  if [ "$PORT" -le "1024" ]; then
#    sudo -v
#  fi
  local PORT="3474"
  superstatic --host localhost --port "$PORT"
  open "http://localhost:3474"
  # superstatic ./ -p "$PORT"
}

# Get IP from hostname

hostname2ip() {
  ping -c 1 "$1" | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
}

# Upload file to transfer.sh
# https://github.com/dutchcoders/transfer.sh/

transfer() {
  tmpfile=$( mktemp -t transferXXX )
  curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) >> $tmpfile;
  cat $tmpfile;
  rm -f $tmpfile;
}

# Find real from shortened url

unshorten() {
  curl -sIL $1 | sed -n 's/Location: *//p'
}

