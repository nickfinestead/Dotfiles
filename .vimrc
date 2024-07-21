" vim cheatsheet
" https://vim.rtorr.com/#:~:text=Ctrl%20%2B%20d%20%2D%20move%20cursor%20and,screen%20up%201%2F2%20page

filetype plugin on
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set hlsearch
set nowrap
set relativenumber
set formatoptions=croql

"	OVERALL KEYBINDS
"	<C-Tab> switches to the next tab
"	<C-S-Tab> switches to the last tab
"	<C-q> closes all windows if they are not MODIFIED.
map <C-Tab> gt
map <C-S-Tab> gT
map <C-q> <ESC>:qa<CR>
"	INSERT KEYBINDS
"	<S-Tab> in insert moves whole line one tab backwards
"	<C-Tab> in insert moves whole line one tab forwards
inoremap <S-Tab> <C-d>
inoremap <C-Tab> <C-t>

"	NORMAL KEYBINDS
"	<Tab> moves cursor one to right
"	<S-Tab> moves cursor one to the left
"	<C-s> inserts a line below and returns to normal
"	<C-z> opens a terminal on the bottom of the window
"	<C-a> clears search highlighting.
nnoremap <Tab> l
nnoremap <S-Tab> h
nnoremap <C-s> o<ESC>
nnoremap <C-z> :ter<CR><C-W>J<C-W>:echo ''<CR>
nnoremap <C-a> <ESC>:nohl<CR>:echo ''<CR>
nnoremap <Up> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Down> <Nop>
"	COLORING
"	- ModeMsg will be white text with no background.
"	- Search(s) will be black text with a white background
"	- Comment(s) will be unbolded cyan text with no background.
"	- Statements will not be bolded, to avoid weird behavior with hlsearch
"	- Customized coloring when using diff.
colorscheme slate

highlight LineNr	ctermfg=green
highlight ModeMsg	ctermbg=0
highlight Search	ctermbg=7  ctermfg=0
highlight Comment	cterm=NONE ctermfg=6
highlight Statement	cterm=NONE
highlight DiffAdd	 term=NONE ctermbg=green ctermfg=white
highlight DiffChange	 term=NONE ctermbg=blue ctermfg=black
highlight DiffText	 term=NONE ctermbg=blue ctermfg=white
highlight DiffDelete	 term=NONE ctermbg=red
