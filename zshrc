# Not all terminal emulators seem to add this—uncomment if needed.
# export PATH="$PATH:/usr/local/bin"
# Add personal scripts to PATH
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="$PATH:$HOME/bin-personal"

if [[ "$OSTYPE" == darwin* ]]; then
  # Add haskell packages to PATH
  export PATH="$HOME/.local/bin:$PATH"
  # Add gnu-sed as 'sed' to PATH
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
  # Add rust to PATH
  export PATH="$HOME/.cargo/bin:$PATH"
  # Add ruby to PATH
  export PATH="/usr/local/opt/ruby/bin:$PATH"
  # Add go to PATH
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
  # Add n (nvm alternative) to PATH
  export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"


  export HOMEBREW_NO_INSTALL_CLEANUP="true"
  export HOMEBREW_GITHUB_API_TOKEN="dc53bd2633864b72f077326b72ec0ba4226b2396"
  export NIX_CHANNEL="nixos-19.03"
  export NIX_REMOTE_SYSTEMS="/etc/nix/machines"
  export MY_MACHINE="macos"
fi

if [[ "$OSTYPE" != darwin* && -d "$HOME/.config/yarn/global/node_modules/.bin" ]]; then
  export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

if [[ "$OSTYPE" != darwin* ]]; then
  export XDG_CURRENT_DESKTOP="Unity"
  export MY_MACHINE="nixos"
fi

export EDITOR="nvim"
bindkey -e
export LANG="en_CA.UTF-8"
export LC_ALL="en_CA.UTF-8"

# fzf for nixos
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi

# fzf for others
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Neovim colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Nix package manager
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# use <c-s> in all applications
stty -ixon

### Added by Zplugin's installer: https://github.com/zdharma/zplugin
# Check back for rollback feature: https://github.com/zdharma/zplugin/issues/135#issuecomment-497585546
# Update plugins: `zpl update --all`; update and compile zplugin: `zpl self-update`.
source $HOME/.zplugin/bin/zplugin.zsh

# Theme (don't lazy load prompt as we want it from start)
# setopt promptsubst
# zplugin light adc17/pure-red-stars
zplugin ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'; 
zplugin light sindresorhus/pure
PROMPT='%(?.%F{blue}.%F{yellow})❯% %(?.%F{yellow}.%F{magenta})❯%(?.%F{green}.%F{red})❯%f '
PURE_CMD_MAX_EXEC_TIME=3600

zplugin ice wait"0" lucid blockf
zplugin snippet OMZ::lib/theme-and-appearance.zsh

# Z
zplugin ice wait"0" lucid blockf
zplugin light agkozak/zsh-z

# Completion
zplugin ice wait"0" lucid blockf
zplugin snippet OMZ::lib/completion.zsh
zplugin ice wait"0" lucid blockf
zplugin light zsh-users/zsh-completions

# n.b. this will be cached and require deleting if there are changes
zplugin ice wait"0" lucid blockf
zplugin snippet $HOME/dotfiles/zsh-completions-personal.zsh

# Syntax highlighting
zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zplugin light zsh-users/zsh-syntax-highlighting

for zsh_source in $HOME/dotfiles/zsh/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running
