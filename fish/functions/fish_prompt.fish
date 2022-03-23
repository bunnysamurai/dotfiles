function fish_prompt --description 'Write out the prompt'
    set -l normal (set_color normal)

    # note to self:
    # if we have a big spicy repo that makes the git statuses take too long, we
    # can set these _git_ variables to make fish not do git status on that
    # particular repo -
    # `git config --local bash.showinformativestatus false`
    # `git config --lcoal bash.showdirtystate false`

    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_hide_untrackedfiles true  # hide count of untracked files
    set -g __fish_git_prompt_showupstream "auto"

    set -g __fish_git_prompt_color_branch magenta --bold
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_prefix ""

    set -g __fish_git_prompt_char_stagedstate "●"
    set -g __fish_git_prompt_char_dirtystate "✚"
    set -g __fish_git_prompt_char_untrackedfiles "…"
    set -g __fish_git_prompt_char_invalidstate "✖"
    set -g __fish_git_prompt_char_cleanstate "✔"

    set -g __fish_git_prompt_color_dirtystate cyan --dim
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    set -g __fish_git_prompt_color_cleanstate green --bold

    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

    echo -e -n -s (set_color $fish_color_user) "$USER" $normal @ (set_color $fish_color_host) (prompt_hostname) $normal ' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal "\n" $suffix " "
end
