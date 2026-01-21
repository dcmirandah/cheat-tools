# .zshrc

# Install oh-my-posh if not already installed
if ! command -v oh-my-posh &> /dev/null; then
  curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# Load oh-my-posh with a custom theme
eval "$(oh-my-posh init zsh --config 'https://github.com/JanDeDobbeleer/oh-my-posh/raw/refs/heads/main/themes/craver.omp.json')"

# User specific aliases
alias ll='ls -alF --color=auto'
alias open='~/.cheat-tools/open.sh'
alias fmt='~/.cheat-tools/fmt.sh'
alias sshmenu='~/.cheat-tools/sshmenu.sh'
alias reset_git_history='~/.cheat-tools/reset_git_history.sh'
