#!/usr/bin/env bash
# peter's bash installer

sudo pacman -S chromium inkscape julia python-pip R ranger zathura zathura-cb zathura-djvu zathura-pdf-mupdf

for file in ~/dotfiles/{path, bash_prompt, exports, aliases, functions, extra}; do
	[-r "$file ] && [ -f "$file" ] && ln -s ~/dotfiles/"$file" ~/"$file";
done;
