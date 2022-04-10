# Git
function git_current_branch() {
  git symbolic-ref HEAD 2>/dev/null | sed 's/refs\/heads\///'
}

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
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gl='git pull'
alias gf='git fetch'
alias gup='git pull --rebase'
alias gb='git branch'
alias gcp="git cherry-pick"
alias gm="git merge"
alias gmff="git merge --ff-only"

function gpsup() {
  git push --set-upstream origin "$(git_current_branch)"
}

function ggsup() {
  git branch --set-upstream-to="origin/$(git_current_branch)"
}

# Kubernetes
alias k="kubectl"

function kc() {
  kubectl config use-context $1 && \
  kubectl config set-context --current --namespace=$2
}

function kns() {
  kubectl config set-context --current --namespace=$1
}

# Helm upgrade with with helm-deno, helm-secrets and helm-diff
alias hug="$HOME/Work/csssr-infrastructure/scripts/helm-upgrade.sh"
alias hun="$HOME/Develop/helm-upgrade-now.sh"


# Other
alias ff='rm -rf'
alias pl="cd $HOME/Desktop/playground"
alias nts="nvim ~/Desktop/notes.md"
alias vim="nvim"
alias code="codium" # https://vscodium.com/
alias dg="dig +noall +answer"

# # Like `watch` but in current shell
funbction wa() {
  while [[ true ]]; do
    result=$(eval $@)
    clear
    echo "$(date)"
    echo
    # set_color magenta
    printf "\$"
    # set_color cyan
    echo " $argv"
    # set_color normal
    echo
    echo "$result"
    sleep 2
  done
}

function h() {
  curl https://cheat.sh/$argv
}

source /usr/local/share/autojump/autojump.zsh

export EDITOR="nvim"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

export NPM_CONFIG_PREFIX="$HOME"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.krew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/usr/local/opt/openssl/bin:$PATH"

source /usr/local/opt/asdf/libexec/asdf.sh

# CSSSR config
source "$HOME/.config/csssr/non-breaking-profile"
export KUBECONFIG="$HOME/.kube/config:$KUBECONFIG"
export VAULT_ADDR="https://vault.csssr.com:8200"
export LOKI_ADDR=https://log.csssr.com
export LOKI_BEARER_TOKEN=(yq eval '.["github.com"].oauth_token' ~/.config/gh/hosts.yml)

# https://github.com/Nitive/kubectl-grep
export PATH="$HOME/Develop/kubectl-grep/bin:$PATH"
export KUBECTL_GREP_PASS_OUTPUT="bat --language yaml --style plain --color always"

alias d="docker"
alias dc="docker compose"

export GOPATH="$HOME/go"

HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

export PATH="$HOME/.radicle/bin:$PATH"

# Google Cloud
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# Do Not Track
export DO_NOT_TRACK=1
export GATSBY_TELEMETRY_DISABLED=1
export HOMEBREW_NO_ANALYTICS=1
export STNOUPGRADE=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
