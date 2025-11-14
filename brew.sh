#!/usr/bin/env zsh

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew and upgrade already installed formulae.
brew update && brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

# Install `wget` with IRI support.
brew install wget 

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install essential apps
brew install pyenv
#===============================
# run the following to configure shell environment for pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
#================================
# formulae
brew install r
brew install vim #--with-override-system-vim --enable-gui
brew install borgbackup
brew install openconnect
# casks
brew install --cask anki
brew install --cask firefox
brew install --cask inkscape
brew install --cask mactex-no-gui # takes a while...
brew install --cask netnewswire
brew install --cask rectangle
brew install --cask signal
brew install --cask skim
brew install --cask iterm2
brew install --cask thunderbird
brew install --cask whatsapp

# Install other useful binaries.
brew install git
# Remove outdated versions from the cellar.
brew cleanup
