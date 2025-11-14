#!/usr/bin/env zsh
set -e

echo "[*] Installing Homebrew (if missing)..."
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "[*] Updating Homebrew..."
brew update && brew upgrade

echo "[*] Installing formulae..."
brew install wget gnupg pyenv r vim borgbackup openconnect git
brew cleanup

echo "[*] Installing casks..."
brew install --cask anki firefox inkscape iterm2 mactex-no-gui netnewswire rectangle signal skim thunderbird whatsapp || true

echo "[*] Configuring shell..."
echo 'export PATH="$(brew --prefix)/bin:$PATH"' >> ~/.zprofile
echo 'export VISUAL="$(brew --prefix)/bin/vim"' >> ~/.zshrc
echo 'export EDITOR="$VISUAL"' >> ~/.zshrc
