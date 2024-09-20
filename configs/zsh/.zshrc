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

alias pvtrepo="cd ~/Repo/pvt/pvt"
alias dotrepo="cd ~/Repo/pvt/vt/.dotfiles"
alias ogrepo="cd ~/Repo/optg"
alias ot2repo="cd ~/Repo/optg/ot2-main"
