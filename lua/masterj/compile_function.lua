vim.cmd([[
" Compile function
noremap com :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		exec "!gcc  % -o %<"
		:sp
		:term ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
  elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
  elseif &filetype == 'rust' 
    set splitbelow
    :sp 
    :term cargo run 
	endif
endfunc]])

vim.cmd [[map <leader>c :w! \| !compiler "<c-r>%"<CR>]]
vim.cmd [[ map <leader>p :!opout <c-r>%<CR><CR>]]
vim.cmd([[autocmd VimLeave *.tex !texclear %]])
