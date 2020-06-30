#!/usr/bin/env bash
# peter's bash installer

#
# these are the pacman packages I need to have in every work device
sudo pacman -Syyu biber firefox inkscape julia kitty mpv newsboat python-pip r ranger texlive-most gvim zathura zathura-cb zathura-djvu zathura-pdf-mupdf

# Now symlink the relevant dotfiles
for file in ~/dotfiles/{path, bash_prompt, exports, aliases, functions, extra, vimrc}; do
	[-r "$file" ] && [ -f "$file" ] && ln -s /home/"$USER"/dotfiles/"$file" /home/"$USER"/"$file";
done;
# run vim once to allow the plugins to get installed.
# This symlink ensures my ultisnips snippets still work with my vimrc.
# ln -s /home/"$USER"/dotfiles/mysnippets /home/"$USER"/.vim/mysnippets

# This symlink configures newsboat:
ln -s /home/"$USER"/dotfiles/newsboat/urls /home/"$USER"/.newsboat/
ln -s /home/"$USER"/dotfiles/newsboat/config /home/"$USER"/.newsboat/

# install my essential python packages
pip3 install Unidecode virtualenv virtualenvwrapper
