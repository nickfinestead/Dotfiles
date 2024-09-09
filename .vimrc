" vim cheatsheet
" https://vim.rtorr.com/#:~:text=Ctrl%20%2B%20d%20%2D%20move%20cursor%20and,screen%20up%201%2F2%20page

filetype plugin on
syntax on
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:^
set hlsearch
set nowrap
set relativenumber
set number
set formatoptions=croql
set expandtab
set shiftwidth=4
set tabstop=4
set noswapfile
set clipboard^=unnamed
"	OVERALL KEYBINDS
"	<C-Tab> switches to the next tab
"	<C-S-Tab> switches to the last tab
"	<C-q> closes all windows if they are not MODIFIED.
"map <C-Tab> gt
"map <C-S-Tab> gT

"map <C-q> <ESC>:qa<CR>
"	INSERT KEYBINDS
"	<S-Tab> in insert moves whole line one tab backwards
"	<C-Tab> in insert moves whole line one tab forwards
"inoremap <S-Tab> <C-d>
"inoremap <C-Tab> <C-t>

"	NORMAL KEYBINDS
"	<Tab> moves cursor one to right
"	<S-Tab> moves cursor one to the left
"	<C-s> inserts a line below and returns to normal
"	<C-z> opens a terminal on the bottom of the window
"	<C-a> clears search highlighting.
"nnoremap <Tab> l
"nnoremap <S-Tab> h
"nnoremap <C-s> o<ESC>
nnoremap <C-q> :ter<CR><C-W>J<C-W>:echo ''<CR>
nnoremap <C-c> <ESC>:nohl<CR>:echo ''<CR>
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

nnoremap <F3> <ESC>:highlight MatchParen term=reverse ctermfg=16 ctermbg=220 guifg=#000000 guibg=#ffd700<CR>ech <CR>


nnoremap <F2> <ESC>:highlight MatchParen NONE<CR>
if &syntax =="" 
    set filetype="notes"
endif

set laststatus=2
set statusline=
set statusline +=\ %n\            "buffer number
set statusline +=%{&ff}            "file format
set statusline +=%y                "file type
set statusline +=\ %<%F            "full path
set statusline +=%m                "modified flag
set statusline +=%=%5l             "current line
set statusline +=/%L               "total lines
set statusline +=%4p%%             "percent
set statusline +=%4v\              "virtual column number
set statusline +=0x%04B\           "character under cursor
