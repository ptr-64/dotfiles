# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export QT_QPA_PLATFORMTHEME="qt5ct"
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
