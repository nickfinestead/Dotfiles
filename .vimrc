" vim cheatsheet
" https://vim.rtorr.com/#:~:text=Ctrl%20%2B%20d%20%2D%20move%20cursor%20and,screen%20up%201%2F2%20page

filetype plugin on
syntax on

let g:netrw_banner=0
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:^
set hlsearch
set nowrap
set relativenumber
set number
set formatoptions=croql
"set expandtab
set shiftwidth=4
set tabstop=4
set noswapfile
set clipboard^=unnamed
set path+=**
set wildmenu
set timeout timeoutlen=3000 ttimeoutlen=100
set showcmd

" STATUS lINE FORMATTING
set laststatus=2
set statusline=
set statusline +=\ %n\             "buffer number
set statusline +=%{&ff}            "file format
set statusline +=%y                "file type
set statusline +=\ %<%F            "full path
set statusline +=%m                "modified flag
set statusline +=%=%5l             "current line
set statusline +=/%L               "total lines
set statusline +=%4p%%             "percent
set statusline +=%4v\              "virtual column number
set statusline +=0x%04B\           "character under cursor

packadd! matchit

" NORMAL
"	<C-q> opens a terminal on the bottom of the window
"	<C-c> clears search highlighting.
"	<F2>  removes highlighting for matching paren/brace
"	<F3>  applies highlighting for matching paren/brace
nnoremap <C-q> :ter<CR><C-W>J<C-W>:echo ''<CR>
nnoremap <C-c> <ESC>:nohl<CR>:echo ''<CR>
nnoremap <F2> <ESC>:highlight MatchParen NONE<CR>
nnoremap <F3> <ESC>:highlight MatchParen term=reverse ctermfg=16 ctermbg=220 guifg=#000000 guibg=#ffd700<CR>:echo  ''<CR>
nnoremap <Up> <Nop>
nnoremap <Left> gt
nnoremap <Right> gT
nnoremap <Down> <Nop>

inoremap <C-w> <Nop>
"	COLORING
colorscheme slate
highlight LineNr	 ctermfg=green
highlight ModeMsg	 ctermbg=0
highlight Search	 ctermbg=7  ctermfg=0
highlight Comment	 cterm=NONE ctermfg=6
highlight Statement	 cterm=NONE
highlight DiffAdd	 term=NONE  ctermbg=green ctermfg=white
highlight DiffChange term=NONE  ctermbg=blue  ctermfg=black
highlight DiffText	 term=NONE  ctermbg=blue  ctermfg=white
highlight DiffDelete term=NONE  ctermbg=red
highlight MatchParen term=NONE  ctermbg=blue  ctermfg=white

if &syntax ==""
    set filetype="notes"
endif


" COMMANDS
function! Trail()
	:%s/\s\+$//e
endfunction
