# for DOTFILE in `find /Users/bobby/.dotfiles/system`
# for DOTFILE in `find /Users/jason/repos/.dot/config/zsh`
# do
  # [ -f $DOTFILE ] && source $DOTFILE
# done

source ~/repos/.dot/config/zsh-themes/agnoster.zsh-theme

# Static loading: Run antibody only when plugins.txt changed, else load the “static” plugins file
# antibody bundle < ~/dev/dotfiles/config/antibody/plugins.txt > ~/dev/dotfiles/config/antibody/plugins.zsh
# source ~/dev/dotfiles/config/antibody/plugins.zsh

for DOTFILE in  `find ~/repos/.dot/config/zsh/*.zsh`
do 
# source $file 
  [ -f $DOTFILE ] && source $DOTFILE
done

# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_PROMPT_SEPARATE_LINE=false
# SPACESHIP_CHAR_SYMBOL=❯
# SPACESHIP_CHAR_SUFFIX=" "
# SPACESHIP_HG_SHOW=false
# SPACESHIP_PACKAGE_SHOW=false
# SPACESHIP_NODE_SHOW=false
# SPACESHIP_RUBY_SHOW=false
# SPACESHIP_ELM_SHOW=false
# SPACESHIP_ELIXIR_SHOW=false
# SPACESHIP_XCODE_SHOW_LOCAL=false
# SPACESHIP_SWIFT_SHOW_LOCAL=false
# SPACESHIP_GOLANG_SHOW=false
# SPACESHIP_PHP_SHOW=false
# SPACESHIP_RUST_SHOW=false
# SPACESHIP_JULIA_SHOW=false
# SPACESHIP_DOCKER_SHOW=false
# SPACESHIP_DOCKER_CONTEXT_SHOW=false
# SPACESHIP_AWS_SHOW=false
# SPACESHIP_CONDA_SHOW=false
# SPACESHIP_VENV_SHOW=false
# SPACESHIP_PYENV_SHOW=false
# SPACESHIP_DOTNET_SHOW=false
# SPACESHIP_EMBER_SHOW=false
# SPACESHIP_KUBECONTEXT_SHOW=false
# SPACESHIP_TERRAFORM_SHOW=false
# SPACESHIP_TERRAFORM_SHOW=false
# SPACESHIP_VI_MODE_SHOW=false
# SPACESHIP_JOBS_SHOW=false

# # Spaceship Prompt
# autoload -U promptinit; promptinit
# prompt spaceship


