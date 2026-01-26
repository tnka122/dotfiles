# load local configure
[ -f ${HOME}/.zshrc ] && source ${HOME}/.zshrc

eval "$(mise activate zsh)"
eval "$(sheldon source)"
export PATH="$HOME/.local/bin:$PATH"
