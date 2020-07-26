function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end

    set_color $fish_color_cwd
    printf '\n%s' (prompt_pwd)
    set_color normal

    set_color yellow
    printf "%s " (fish_vcs_prompt)
    set_color normal

    set_color blue
    printf (kubectl-current-context -s='⎈')
    set_color normal

    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '$ '
    set_color normal
end
