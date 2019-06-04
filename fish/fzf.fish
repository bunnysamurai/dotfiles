
source /usr/share/fzf/shell/key-bindings.fish

set -gx FZF_DEFAULT_OPTS    '--layout=reverse --inline-info --height=40% --min-height=15'
set -gx FZF_DEFAULT_COMMAND 'fd --type f'
set -gx FZF_CTRL_T_COMMAND  $FZF_DEFAULT_COMMAND

function kp --description "Kill processes"
  set -l __kp__pid ''

  if contains -- '--tcp' $argv
    set __kp__pid (lsof -Pwni tcp | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:tcp]'" | awk '{print $2}')
  else
    set __kp__pid (ps -ef | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:process]'" | awk '{print $2}')
  end

  if test "x$__kp__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__kp__pid | xargs kill $argv[1]
    else
      echo $__kp__pid | xargs kill -9
    end
    kp
  end
end

# Key bindings
# ------------

function fish_user_key_bindings
  fzf_key_bindings
end
