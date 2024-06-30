# Setup fzf
# ---------
if [[ ! "$PATH" == */home/coder-vasen/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/coder-vasen/.fzf/bin"
fi

source <(fzf --zsh)
