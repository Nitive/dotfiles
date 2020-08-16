function fish_prompt
    set -l last_status $status
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end

    set_color $fish_color_cwd
    printf ' \n%s' (prompt_pwd)
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

    if [ "$last_status" != "0" ]
      set_color red
      printf '$'
      if [ "$last_status" != "1" ]
        printf " ($last_status)"
      end
      set_color normal
    else
      printf '$'
    end
    printf ' '

    set_color normal
end
