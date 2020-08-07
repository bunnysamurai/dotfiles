
function kraken --description "Open gitkraken"
  set dir $argv[1] (pwd) # use a directory if you pass it in, otherwise cwd
  gitkraken -p $dir >/dev/null 2>&1   &
end
