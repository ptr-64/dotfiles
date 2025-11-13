#!/usr/bin/env bash
set -e

echo "[*] Updating system..."
sudo apt update -y && sudo apt upgrade -y

echo "[*] Installing packages..."
sudo apt install -y zsh git curl wget gnupg python3 python3-venv vim borgbackup docker.io


echo "[*] Setting default shell to zsh..."
chsh -s "$(command -v zsh)"

