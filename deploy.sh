#!/bin/sh

USER_HOME="$HOME"
CHEAT_DIR="$USER_HOME/.cheat-tools"

# Create cheat-tools directory if it doesn't exist
mkdir -p "$CHEAT_DIR"

# Copy tools
cp -r tools/* "$CHEAT_DIR/"

# Chmod scripts to be executable
chmod +x "$CHEAT_DIR"/*.sh

# Deploy config based on shell availability
if command -v zsh >/dev/null 2>&1; then
	echo "zsh detected. Deploying .zshrc..."
	cp "$(dirname "$0")/configurations/.zshrc" "$USER_HOME/.zshrc"
	echo "Done. .zshrc deployed."
fi

if command -v bash >/dev/null 2>&1; then
	echo "bash detected. Deploying .bashrc..."
	cp "$(dirname "$0")/configurations/.bashrc" "$USER_HOME/.bashrc"
	echo "Done. .bashrc deployed."
fi

echo "Cheat tools deployed to $CHEAT_DIR."
