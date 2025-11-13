#!/usr/bin/env zsh
set -e

OS=$(uname -s)
DOTFILES="$HOME/dotfiles"

echo "[*] Detected OS: $OS"

case "$OS" in
  Darwin)
    zsh "$DOTFILES/setup/mac.sh"
    ;;
  Linux)
    bash "$DOTFILES/setup/server.sh"
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac

# Common setup (OMZ, symlinks, etc.)
zsh "$DOTFILES/setup/common.sh"

##!/usr/bin/env zsh
#
## install omz
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## install brew
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## now source the brew.sh file
## peter's bash installer
## Now symlink everythin
#ln -sf /Users/"$USER"/dotfiles/.gitconfig /Users/"$USER"/.gitconfig
#ln -sf /Users/"$USER"/dotfiles/.gitignore /Users/"$USER"/.gitignore
#ln -sf /Users/"$USER"/dotfiles/.Rprofile /Users/"$USER"/.Rprofile
#ln -sf /Users/"$USER"/dotfiles/.tmux.conf /Users/"$USER"/.tmux.conf
#ln -sf /Users/"$USER"/dotfiles/.vimrc /Users/"$USER"/.vimrc
#ln -sf /Users/"$USER"/dotfiles/.vim /Users/"$USER"/.vim
#
## run vim once to allow the plugins to get installed.
#
#
