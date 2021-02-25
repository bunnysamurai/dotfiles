
function kraken --description "Open gitkraken"
  set dir $argv[1] (pwd) # use a directory if you pass it in, otherwise cwd
  bash -c "gitkraken -p $dir" # /usr/bin/gitkraken is a bash script without a shebang.
end
