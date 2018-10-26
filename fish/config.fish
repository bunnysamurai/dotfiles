# pull in aliases and environment
source $HOME/.config/fish/env.fish
source $HOME/.config/fish/aliases.fish

# clear greeting
set -g fish_greeting

# Path modifications
set -g fish_user_paths $HOME/bin $DOTFILES/bin
