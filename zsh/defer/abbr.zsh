# zsh-abbr is set up based on $ABBR_USER_ABBREVIATIONS_FILE.
# If you want to update abbr settings, remove the user-abbreviations file or run `abbr-update`.

abbr-update() {
  rm $ABBR_USER_ABBREVIATIONS_FILE && exec zsh
}

# bat
abbr b='bat'
# cd
abbr cdw='cd ~/workspace'
abbr ..='cd ..'
# docker
abbr d='docker'
abbr dcc='docker compose'
# elixir
abbr mxd='mix deps.get'
abbr mxt='mix test'
# git
abbr g='git'
abbr ga='git add'
abbr gau='git add -u'
abbr gaa='git add -A'
abbr gb='git branch'
abbr gbm='git branch -m'
abbr gcmm='git commit -m'
abbr gd='git diff'
abbr gs='git status -sb'
abbr gsw='git switch'
abbr gswc='git switch -c'
# ls
abbr l='eza --icons'
abbr ll='eza -l --icons'
abbr la='eza -a --icons'
abbr lla='eza -la --icons'
# python
abbr vact='source ./.venv/bin/activate'
# vim
abbr v='nvim'
