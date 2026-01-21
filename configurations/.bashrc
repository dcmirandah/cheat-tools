# Path
export PATH="$HOME/.local/bin:$PATH"

# Switch to zsh if available and set a custom prompt
PROMPT_COMMAND=set_prompt
if command -v zsh >/dev/null 2>&1; then
  exec zsh
fi

# User specific aliases
alias docs='terraform-docs markdown . --output-file readme.md'
alias docs-new='terraform-docs markdown . --output-file readme-new.md'
alias ll='ls -alF --color=auto'
alias open='~/.cheat-tools/open.sh'
alias fmt='~/.cheat-tools/fmt.sh'

# Enables tab-completion for the 'k' alias using kubectl's completion function
complete -F __start_kubectl k

# Enable vi mode for command line editing
set -o vi

# Git branch + dirty indicator
git_info() {
  local branch dirty=""
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n "$branch" ]]; then
      [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty="*"
      echo -n " (\[\e[32m\]${branch}${dirty}\[\e[0m\])"
    fi
  fi
}

# Get last part of the path
short_pwd() {
  echo "${PWD##*/}"
}

# Build the full prompt string
set_prompt() {
  PS1="\[\e[34m\]\A\[\e[0m\] \[\e[36m\]\u@\h\[\e[0m\]:\[\e[33m\]$(short_pwd)\[\e[0m\]$(git_info) \$ "
}

