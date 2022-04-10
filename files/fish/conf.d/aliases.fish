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
alias gcp="git cherry-pick"
alias gm="git merge"
alias gmff="git merge --ff-only"

function gbdl
  echo "This branches will be removed"
  set branches (gb --no-color --format='%(refname:short)' | grep -v (git_current_branch))
  printf '%s\n' $branches
  echo "Press enter to continue"
  read confirm
  echo $branches | xargs git branch -D
end

function pr_from_commit
  git status

  echo "Commit:"
  read commit

  echo "Branch:"
  read branch

  echo "Base branch:"
  read base_branch

  git fetch
  git checkout -b "$branch" "origin/$base_branch"

  git cherry-pick "$commit"

  gpsup # see alias above

  echo "Press enter to continue"
  read confirm

  gh pr create --fill
end


# Kubernetes
alias k="kubectl"

# Interactive command to select context
function kc
  nohup fish -c 'kc-update-cache' > /dev/null &; disown
  nohup fish -c 'kns-update-cache' > /dev/null &; disown

  set -l selected_context (cat "$HOME/.local/share/kubectl-switch-cache/contexts-names" | fzf) || return 0
  kubectl config use-context "$selected_context"

  kns
end

function kc-update-cache
  set -l cache_dir_path "$HOME/.local/share/kubectl-switch-cache"
  mkdir -p "$cache_dir_path"
  kubectl config get-contexts -o name > "$cache_dir_path/contexts-names.tmp"
  cat "$cache_dir_path/contexts-names.tmp" > "$cache_dir_path/contexts-names"
  rm "$cache_dir_path/contexts-names.tmp"
end

# Interactive command to select namespace
function kns
  nohup fish -c 'kns-update-cache' > /dev/null &; disown

  set -l current_context (kubectl-current-context -o context)
  set -l selected_namespace (cat "$HOME/.local/share/kubectl-switch-cache/namespaces-in-contexts/$current_context" | fzf) || return 0
  kubectl config set-context --current --namespace="$selected_namespace"
end

function kns-update-cache
  mkdir -p "$HOME/.local/share/kubectl-switch-cache/namespaces-in-contexts"
  set -l current_context (kubectl-current-context -o context)
  kubectl get ns -o json | jq .items[].metadata.name -r > "$HOME/.local/share/kubectl-switch-cache/namespaces-in-contexts/$current_context"
end

# Helm upgrade with with helm-deno, helm-secrets and helm-diff
alias hug="$HOME/Work/csssr-infrastructure/scripts/helm-upgrade.sh"


# Other
alias ff='rm -rf'
alias pl="cd ~/Desktop/playground"
alias nts="nvim ~/Desktop/notes.md"
alias vim="nvim"
alias code="codium" # https://vscodium.com/
alias dg="dig +noall +answer"

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
