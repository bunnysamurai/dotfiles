# pull in aliases and environment
source $HOME/.config/fish/env.fish
source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/completions.fish

# clear greeting
set -g fish_greeting

# Path modifications
set -g fish_user_paths $HOME/bin $DOTFILES/bin $HOME/.local/bin $HOME/.cargo/bin

# autojump (autojump-fish pkg)
if test -e /usr/share/autojump/autojump.fish
  source /usr/share/autojump/autojump.fish
end

# fzf stuff
if type -q fzf
  source $HOME/.config/fish/fzf.fish
end

# !!
function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

# !$
function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# enables $?
# function bind_status
#   commandline -i (echo '$status')
# end


# # enables $$
# function bind_self
#   commandline -i (echo '$fish_pid')
# end

function bash_expansion_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
  # bind '$?' bind_status
  # bind '$$' bind_self
end