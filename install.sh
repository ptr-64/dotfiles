#!/usr/bin/env bash
# peter's bash installer

#
# these are the pacman packages I need to have in every work device
# sudo pacman -Syyu base-devel biber firefox inkscape julia kitty mpv newsboat python-pip r ranger texlive-most gvim zathura zathura-cb zathura-djvu zathura-pdf-mupdf

#for file in /home/"$USER"/dotfiles/{path, bash_prompt, exports, aliases, functions, extra, vimrc}; do
#	[-r "$file" ] && [ -f "$file" ] && ln -s /home/"$USER"/dotfiles/".$file" /home/"$USER"/".$file";
#done;
#ln -sf /home/"$USER"/dotfiles/path /home/"$USER"/path
#ln -sf /home/"$USER"/dotfiles/bash_prompt /home/"$USER"/bash_prompt
#ln -sf /home/"$USER"/dotfiles/exports /home/"$USER"/exports
#ln -sf /home/"$USER"/dotfiles/aliases /home/"$USER"/aliases
#ln -sf /home/"$USER"/dotfiles/functions /home/"$USER"/functions
#ln -sf /home/"$USER"/dotfiles/extra /home/"$USER"/extra
#ln -sf /home/"$USER"/dotfiles/vimrc /home/"$USER"/vimrc


# run vim once to allow the plugins to get installed.
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# This symlink configures newsboat:
#ln -sf /home/"$USER"/dotfiles/newsboat/urls /home/"$USER"/.newsboat/
#ln -sf /home/"$USER"/dotfiles/newsboat/config /home/"$USER"/.newsboat/
#
## install my essential python packages
#pip3 install Unidecode virtualenv virtualenvwrapper


