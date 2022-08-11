# FZF specific functionality
source /usr/share/fzf/shell/key-bindings.fish

set -gx FZF_DEFAULT_OPTS '--layout=reverse --inline-info --height=40% --min-height=15'
set -gx FZF_DEFAULT_COMMAND 'fd --type f'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

function kp --description "Kill processes"
    set -l __kp__pid ''

    if contains -- --tcp $argv
        set __kp__pid (lsof -Pwni tcp | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:tcp]'" | awk '{print $2}')
    else
        set __kp__pid (ps -ef | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:process]'" | awk '{print $2}')
    end

    if test "x$__kp__pid" != x
        if test "x$argv[1]" != x
            echo $__kp__pid | xargs kill $argv[1]
        else
            echo $__kp__pid | xargs kill -9
        end
        kp
    end
end

function fcd --description "fuzzy change directory"
    argparse 'h/help' 'H/hidden' 'I/no-ignore' -- $argv

    if set -q _flag_help
        echo "\
fcd - fuzzy change directory
USAGE
  fcd [OPTS] <path>

OPTS:
  -h/--help      - print this help
  -H/--hidden    - include hidden files in output
  -I/--no-ignore - include files that are typically ignored by `fd` in output

ARGS:
  <path>         - path to start cd search from (default .)
"
        return 0
    end

    set -f fd_args
    if set -q _flag_hidden
        set -a fd_args '-H'
    end
    if set -q _flag_no_ignore
        set -a fd_args '-I'
    end

    set -f searchdir '.'
    if set -q argv[1]
        set -f searchdir $argv[1]
    end
    set -l dir (fd $fd_args --type d . $searchdir | fzf)
    # set -l
    if set -q dir[1]
        cd $dir
    end
end
