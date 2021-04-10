# Shortcuts

alias reload="source ~/.zshrc"
alias _="sudo"
alias g="git"
alias gall="git add ."
alias glog="git log --pretty=format:'%Cred%h %Cgreen %cd %Cblue%<(14,trunc)%an %Creset %s %Cred %d %Creset' --graph --date=short -20"
alias gitpretty="git log --oneline --decorate --all --graph --stat"
alias gstat="git log --stat"

# Default options
alias json="json -c"

# List declared aliases, functions, paths
alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'

# Directory listing/traversal

# LS_COLORS=$(is-supported "ls --color" --color -G)
# LS_TIMESTYLEISO=$(is-supported "ls --time-style=long-iso" --time-style=long-iso)
# LS_GROUPDIRSFIRST=$(is-supported "ls --group-directories-first" --group-directories-first)

alias l="ls -lahA"
alias lls="exa -laFh --git"

alias man='batman' # replace standard man pager with batman in bat-extras

alias rr="rm -rf"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"                  # Go to previous dir with -
alias cd.='cd $(readlink -f .)'    # Go to real dir (i.e. if current dir is linked)

alias tree="tree -A"
alias treed="tree -d"
alias tree1="tree -d -L 1"
alias tree2="tree -d -L 2"

# npm

alias ni="npm install"
alias nu="npm uninstall"
alias nup="npm update"
alias nri="rm -r node_modules && npm install"
alias ncd="npm-check -su"

# rsync
alias rsync="rsync -vh"

# Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias localips="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Request using GET, POST, etc. method

for METHOD in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$METHOD"="lwp-request -m '$METHOD'"
done
unset METHOD

# Miscellaneous

alias hosts="sudo $EDITOR /etc/hosts"
alias his="historie"
alias quit="exit"
alias week="date +%V"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

# host/port status check
alias uporno="bash ~/scripts/uporno.sh"

# GitHub Markdown previewer
alias grip="grip -b"

# audio streaming script
alias radio="bash ~/scripts/radio.sh"

# YouTube video streamer
alias bashtube="bash ~/scripts/bashtube.sh"

# Tracking what I've learned/done in my did file
alias did="nano -S ~/did.txt"
