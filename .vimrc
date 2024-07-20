" vim cheatsheet
" https://vim.rtorr.com/#:~:text=Ctrl%20%2B%20d%20%2D%20move%20cursor%20and,screen%20up%201%2F2%20page
set number
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
filetype plugin on


" INSERT KEYBINDS
" 	<S-Tab> in insert moves whole line one tab backwards 
" 	<C-Tab> in insert moves whole line one tab forwards
inoremap <S-Tab> <C-d>
inoremap <C-Tab> <C-t>

" NORMAL KEYBINDS 
" 	<Tab> moves cursor one to right
" 	<S-Tab> moves cursor one to the left
" 	<C-s> inserts a line below and returns to normal
" 	<C-S-S> inserts a line above and returns to normal
" 	<C-x> opens a terminal on the bottom of the window
nnoremap <Tab> l
nnoremap <S-Tab> h
nnoremap <C-s> o<ESC>
nnoremap <C-S-S> O<ESC>
nnoremap <C-x> :ter<CR><C-W>J
" OVERALL KEYBINDS
" 	<C-Tab> switches to the next tab
" 	<C-S-Tab> switches to the last tab
" 	<C-q> closes all windows if they are saved.
map <C-Tab> gt
map <C-S-Tab> gT
map <C-q> <ESC>:qa<CR>
