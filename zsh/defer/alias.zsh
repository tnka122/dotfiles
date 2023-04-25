alias ls='ls --color=auto'
alias exa='exa --icons'
alias :q='exit'

mkcd() {
    mkdir -p $1 && cd $1
}
