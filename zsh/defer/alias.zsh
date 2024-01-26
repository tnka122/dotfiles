alias :q='exit'

mkcd() {
    mkdir -p $1 && cd $1
}

git-switch-pr() {
    git fetch origin pull/$1/head:PR-$1 && git switch PR-$1
}
