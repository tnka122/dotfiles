alias :q='exit'

mkcd() {
    mkdir -p $1 && cd $1
}

git_fetch_pr() {
    git fetch origin pull/$1/head:PR-$1
}
