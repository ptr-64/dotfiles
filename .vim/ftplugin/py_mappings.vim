augroup ftype_py
	autocmd!
	autocmd BufWritePre,BufRead *.py :normal! gg=G
	autocmd Filetype python setlocal expandtab foldmethod=indent
	autocmd BufRead,BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /s\s\+$/
augroup END
