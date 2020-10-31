#!/usr/bin/env bash
# peter's bash installer

# First update the mirror list
sudo pacman-mirrors -f
# these are the pacman packages I need to have in every work device
 sudo pacman -Syyu anki base-devel biber firefox inkscape julia mpv python-pip r ranger texlive-most tmux gvim zathura zathura-cb zathura-djvu zathura-pdf-mupdf zopfli

# Now symlink everythin
ln -sf /home/"$USER"/dotfiles/.aliases /home/"$USER"/.aliases
ln -sf /home/"$USER"/dotfiles/.bash_profile /home/"$USER"/.bash_profile
ln -sf /home/"$USER"/dotfiles/.bash_prompt /home/"$USER"/.bash_prompt
ln -sf /home/"$USER"/dotfiles/.bashrc /home/"$USER"/.bashrc
ln -sf /home/"$USER"/dotfiles/.exports /home/"$USER"/.exports
ln -sf /home/"$USER"/dotfiles/.functions /home/"$USER"/.functions
ln -sf /home/"$USER"/dotfiles/.gitconfig /home/"$USER"/.gitconfig
ln -sf /home/"$USER"/dotfiles/.gitignore /home/"$USER"/.gitignore
ln -sf /home/"$USER"/dotfiles/.inputrc /home/"$USER"/.inputrc
ln -sf /home/"$USER"/dotfiles/.Rprofile /home/"$USER"/.Rprofile
ln -sf /home/"$USER"/dotfiles/.tmux.conf /home/"$USER"/.tmux.conf
ln -sf /home/"$USER"/dotfiles/.vimrc /home/"$USER"/.vimrc
ln -sf /home/"$USER"/dotfiles/.vim /home/"$USER"/.vim


# run vim once to allow the plugins to get installed.

# install my essential python packages
pip3 install Unidecode virtualenv virtualenvwrapper
