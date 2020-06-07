#!/usr/bin/env bash
# peter's bash installer

# these are the pacman packages I need to have in every work device
sudo pacman -Syyu biber chromium inkscape julia python-pip r ranger texlive-most w3m zathura zathura-cb zathura-djvu zathura-pdf-mupdf

# Now symlink the relevant dotfiles
for file in ~/dotfiles/{path, bash_prompt, exports, aliases, functions, extra}; do
	[-r "$file" ] && [ -f "$file" ] && ln -s ~/dotfiles/"$file" ~/"$file";
done;

# This symlink ensures my ultisnips snippets still work with my vimrc.
ln -s ~/dotfiles/mysnippets ~/.vim/mysnippets

# install my essential python packages
pip3 install Unidecode virtualenv virtualenvwrapper
