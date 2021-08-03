# Disable greeting
set fish_greeting

# https://github.com/wting/autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# set -o vi
fish_vi_key_bindings

# Editor
export EDITOR="nvim"

# Node.js
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Go
export GOPATH=(asdf where golang)/packages
export PATH="$PATH:$GOPATH/bin"

# Kubernetes
export PATH="$PATH:$HOME/.krew/bin"

# Rust
source "$HOME/.cargo/env"

# https://github.com/asdf-vm/asdf
source /usr/local/opt/asdf/asdf.fish

# Deno
export DENO_DIR="$HOME/Library/Caches/deno"
export PATH="$HOME/.deno/bin:$PATH"

# OpenSSL
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
export SSLKEYLOGFILE="$HOME/.ssl-key.log"

# Set tab size to 4 spaces
tabs -4

# CSSSR config
source "$HOME/.config/csssr/non-breaking-profile-fish"

function fish_mode_prompt
end

# Bind m in command vi mode to opening current command in editor
bind --mode default m edit_command_buffer

export DO_NOT_TRACK=1
export GATSBY_TELEMETRY_DISABLED=1
export HOMEBREW_NO_ANALYTICS=1
export STNOUPGRADE=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
