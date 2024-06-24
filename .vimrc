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
	let curr_dir=expand('%:h')
	let save_cursor=getpos('.')
	let current_line=getline('.')
	let opening_paren_pos=stridx(current_line, '(')-1
	if opening_paren_pos == -1
	       return 1
	endif	
	let function_name=strpart(current_line, save_cursor[2]-1, opening_paren_pos)
	let output=system( "grep -Irn --include='*.h'  \"" . function_name . "\" " .  curr_dir ."\/  | awk -F: ' { print $2,$1 } '" )
	if output != ""
		echo output	
	endif
	"TODO: Add functionality to open in a seperate tab.
	"TODO: Add functionality to search from parent directory and not the
	"current directory 
endfunction
