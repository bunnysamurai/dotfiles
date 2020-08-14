

function fish_user_key_bindings
  if type -q fzf_key_bindings
    fzf_key_bindings
  end
  if type -q bash_expansion_key_bindings
    bash_expansion_key_bindings
  end
end