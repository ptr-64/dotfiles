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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/peter/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/peter/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/peter/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/peter/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

