# Git
function git_current_branch
  git symbolic-ref HEAD 2>/dev/null | sed 's/refs\/heads\///'
end

alias gfp='git push --force-with-lease'
alias gst='git status'
alias gp='git push'
alias gco='git checkout'
alias ga='git add'
alias gapa='git add --patch'
alias gd='git diff'
alias gc='git commit -v'
alias gdca='git diff --cached'
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias glg='git log --stat'
alias glog='git log --oneline --decorate --graph'
alias 'gc!'='git commit -v --amend'
alias gpsup="git push --set-upstream origin (git_current_branch)"
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gl='git pull'
alias gf='git fetch'
alias gup='git pull --rebase'
alias gb='git branch'
alias ggsup="git branch --set-upstream-to=origin/(git_current_branch)"

function gbdl
  echo "This branches will be removed"
  set branches (gb --no-color --format='%(refname:short)' | grep -v (git_current_branch))
  echo $branches
  echo "Press enter to continue"
  read confirm
  echo $branches | xargs git branch -D
end


# Kubernetes
alias k="kubectl"
function kuc
  kubectl config use-context $argv[1] && \
  kubectl config set-context --current --namespace=$argv[2]
end
function kun
  kubectl config set-context --current --namespace=$argv[1]
end


# Other
alias ff='rm -rf'
alias pl="cd ~/Desktop/playground"
alias nts="nvim ~/Desktop/notes.md"
alias vim="nvim"
alias code="codium" # https://vscodium.com/

# Like `watch` but in current shell
function wa
  while true
    $argv | read -z result
    clear
    set now (date)
    echo "$now"
    echo
    set_color magenta
    printf "\$"
    set_color cyan
    echo " $argv"
    set_color normal
    echo "$result"
    sleep 2
  end
end
