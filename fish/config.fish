# Aliases
source $HOME/.config/fish/aliases.fish

# Editor stuff
set -gx EDITOR 'vim'
set -gx VISUAL 'vim'

# Special snowflake variables
set -gx PROJECTS "$HOME/projects"
set -gx DOTFILES "$HOME/.dotfiles"

# Path modifications
set -g fish_user_paths $HOME/bin $DOTFILES/bin
