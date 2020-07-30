augroup ftype_tex
	autocmd!
	autocmd BufNewFile,BufRead *.tex setf tex
	autocmd FileType tex setlocal foldmethod=indent
augroup END
