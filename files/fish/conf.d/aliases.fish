# Git
set git_current_branch (git symbolic-ref HEAD 2>/dev/null | sed 's/refs\/heads\///')
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
alias grbi='git rebase -i'
alias glg='git log --stat'
alias glog='git log --oneline --decorate --graph'
alias 'gc!'='git commit -v --amend'
alias gpsup="git push --set-upstream origin $git_current_branch"
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gl='git pull'
alias gf='git fetch'
alias gb='git branch'

function gbdl
  echo "This branches will be removed"
  set branches "(gb --no-color --format='%(refname:short)' | grep -v "(current_branch)")"
  echo "$branches\n"
  read "?Press enter to continue "
  echo "$branches" | xargs git branch -D
end


# Kubernetes
alias k="kubectl"
function kuc
  kubectl config use-context $argv[1] && \
  kubectl config set-context --current --namespace=$argv[2]
end


# Other
alias ff='rm -rf'
alias pl="cd ~/Desktop/playground"
alias nts="nvim ~/Desktop/notes.md"
alias vim="nvim"
alias code="codium" # https://vscodium.com/

function wa
  # Workaround to get aliases working
  watch "fish -c '$argv'"
end
