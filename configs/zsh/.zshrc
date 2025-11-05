# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
#if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#  source /usr/share/zsh/manjaro-zsh-config
#fi
# Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi
eval "$(starship init zsh)"

export SUDO_EDITOR=nvim


alias pvt="cd ~/Repo/pvt/pvt"
alias dot="cd ~/Repo/pvt/.dotfiles"
alias og="cd ~/Repo/optg"
alias dts="cd ~/Repo/dts"
alias dtsfe="cd ~/Repo/dts/digitaltwinshop-fe"
alias dtsopen="sudo nixos-firewall-tool open tcp 3000"
alias dtsbe="cd ~/Repo/dts/digitaltwinshop-be"
alias ot2="cd ~/Repo/optg/ot2-main"
alias okpi="cd ~/Repo/optg/okpi-main"
alias nixosrepo="cd ~/Repo/pvt/.dotfiles/nixos"

function open-nvim { nvim . }
zle -N open-nvim
bindkey '^N' open-nvim

if command -v nix-your-shell > /dev/null; then
  nix-your-shell zsh | source /dev/stdin
fi
