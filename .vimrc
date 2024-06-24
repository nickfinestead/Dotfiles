" vim cheatsheet
" https://vim.rtorr.com/#:~:text=Ctrl%20%2B%20d%20%2D%20move%20cursor%20and,screen%20up%201%2F2%20page
set number
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
inoremap <S-Tab> <C-d>
inoremap <Tab> <C-t>
" Maps tab to move forward 1 character, and Shift+Tab back 1 character
nnoremap <Tab> l
nnoremap <S-Tab> h

" TODO: Finish Function definition, need to test more with output
function! GotoDefinition()
	let save_cursor=getpos('.')
	let current_line=getline('.')
	let opening_paren_pos=stridx(current_line, '(')
	" if opening_paren_pos == -1
	"	return 1
	" endif	
	" Extract characters until '(' or the entire line if '(' is not found
	let function_name=strpart(current_line, 0, opening_paren_pos)
	let output=system( "grep -rn" . function_name . " *.h | awk -F: ' { print '+'$2,$1 } ' | head -n 1" )
	"if output != ""
	"	echo output	
	"	return output
	"endif
	echo output
endfunction
