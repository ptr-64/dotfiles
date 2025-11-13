#!/usr/bin/env zsh
set -e
DOTFILES="$HOME/dotfiles"

echo "[*] Installing Oh My Zsh (if missing)..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "[*] Symlinking dotfiles..."
ln -sf "$DOTFILES/.gitconfig"  "$HOME/.gitconfig"
ln -sf "$DOTFILES/.gitignore"  "$HOME/.gitignore"
ln -sf "$DOTFILES/.Rprofile"   "$HOME/.Rprofile"
ln -sf "$DOTFILES/.tmux.conf"  "$HOME/.tmux.conf"
ln -sf "$DOTFILES/.vimrc"      "$HOME/.vimrc"
ln -sf "$DOTFILES/.vim"        "$HOME/.vim"
ln -sf "$DOTFILES/zsh/.zshrc"  "$HOME/.zshrc"

echo "[*] Done. Launch a new shell to apply changes."

