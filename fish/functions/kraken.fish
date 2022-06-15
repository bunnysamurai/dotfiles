
function kraken --description "Open gitkraken"
  # use a directory if you pass it in, otherwise cwd
  if [ ! -z "$argv[1]" ]
    set -f dir (realpath $argv[1])
  else
    set -f dir (pwd)
  end
  bash -c "gitkraken -p $dir" # /usr/bin/gitkraken is a bash script without a shebang.
end
