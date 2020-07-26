# Disable greeting
set fish_greeting

# https://github.com/wting/autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# set -o vi
fish_vi_key_bindings

# Node.js
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Go
export PATH="$HOME/go/bin:$PATH"

# Rust
source $HOME/.cargo/env

# https://github.com/asdf-vm/asdf
source /usr/local/opt/asdf/asdf.fish

# OpenSSL
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

# Set tab size to 4 spaces
tabs -4

# CSSSR config
set configs $KUBECONFIG $HOME/.config/csssr/kube-configs/*.yaml
export KUBECONFIG=(string join ':' $configs)
set -e configs

function fish_mode_prompt
end
