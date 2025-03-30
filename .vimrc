" vim cheatsheet
" https://vim.rtorr.com/#:~:text=Ctrl%20%2B%20d%20%2D%20move%20cursor%20and,screen%20up%201%2F2%20page
filetype plugin on
syntax on

let mapleader=","
let g:netrw_banner=0
let g:netrw_liststyle=3
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:^
set nohlsearch
set incsearch
set nowrap
set relativenumber
set number
set formatoptions=croql
"set expandtab
set shiftwidth=4
set tabstop=4
set expandtab
set noswapfile
set clipboard=unnamed
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
let mapleader = " "
packadd! matchit

" NORMAL
"	<C-q> opens a terminal on the bottom of the window
"	<C-c> clears search highlighting.
"	<F2>  removes highlighting for matching paren/brace
"	<F3>  applies highlighting for matching paren/brace
nnoremap <C-q> :ter<CR><C-W>J<C-W>:echo ''<CR>
nnoremap <C-c> <ESC>:nohl<CR>:echo ''<CR>
nnoremap <F2> <ESC>:highlight MatchParen NONE<CR>:echo ''<CR>
nnoremap <F3> <ESC>:highlight MatchParen term=reverse ctermfg=16 ctermbg=220 guifg=#000000 guibg=#ffd700<CR>:echo  ''<CR>
inoremap <C-w> <Nop>

" Move lines in visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>s :%s/<C-r><C-w>//gI<Left><Left><Left>
nnoremap <leader>x :w !chmod +x %<CR>

nnoremap cn :cnext<CR>
nnoremap cp :cprevious<CR>

xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <C-k> <cmd>cnext<CR>zz
nnoremap <C-j> <cmd>cprev<CR>zz
nnoremap <leader>k <cmd>lnext<CR>zz
nnoremap <leader>j <cmd>lprev<CR>zz

nnoremap ++ *Ndwnzz

" Making finding/opening files easier
nnoremap <leader>ff :find<Space>
nnoremap <leader>fv :vsp \| find<Space>
nnoremap <leader>fs :sp \| find<Space>

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
highlight ModeMsg    term=NONE  ctermfg=green  ctermbg=None

if &syntax ==""
	set filetype="notes"
endif


" COMMANDS
" Removes trailing whitespace
function! Trail()
	:%s/\s\+$//e
endfunction

" Searches all open buffers for a pattern and puts into the quick fix menu
function SearchBuffers(pattern)
    cexpr []
    let l:buffers = getbufinfo({'buflisted': 1})
    for l:buf in l:buffers
        let l:bufnr = l:buf.bufnr
        execute 'silent! vimgrepadd /' . a:pattern . '/g ' . bufname(l:bufnr)
    endfor
    if len(getqflist()) > 0
        copen
    else
        cclose
    endif
endfunction

function! NetrwMappings()
	nmap <buffer> l <CR>
endfunction

augroup netrwFix
	autocmd!
	autocmd filetype netrw call NetrwMappings()
augroup END

function! PythonCompiler()
	compiler pyunit
	set makeprg=python3\ %
endfunction

augroup pythonCompiler
	autocmd!
	autocmd filetype python call PythonCompiler()
augroup END
