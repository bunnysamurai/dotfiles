# grrr
alias cls 'clear'

# git stuff
alias glog "git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp 'git push origin HEAD'
alias gc 'git commit'
alias gac 'git add -A; and git commit'
alias gsu 'git submodule update --remote --merge'
alias gls 'git remote get-url origin'

# run in bash
alias bbash 'set -lx NO_FISH 1; and exec bash'

# List so symbols
alias sosym "nm --demangle --dynamic --defined-only --extern-only"

# tree stuff
alias dtree "fd -td | tree --fromfile . --noreport -n"  # show non gitignored directories as a tree
alias ftree "fd | tree --fromfile . --noreport -n"      # tree, but filtered through fd's default filters

# fedora stuff
alias dnfup "sudo dnf upgrade --refresh"

# gdb (oh yes) stuff
alias ngdb "set EDITOR nvim && gdb"
