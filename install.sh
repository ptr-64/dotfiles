#!/usr/bin/env bash
# peter's bash installer

sudo pacman -S biber chromium inkscape julia python-pip r ranger texlive-most zathura zathura-cb zathura-djvu zathura-pdf-mupdf

for file in ~/dotfiles/{path, bash_prompt, exports, aliases, functions, extra}; do
	[-r "$file" ] && [ -f "$file" ] && ln -s ~/dotfiles/"$file" ~/"$file";
done;
