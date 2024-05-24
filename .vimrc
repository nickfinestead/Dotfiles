set number
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

augroup insert_and_remove_before_every_line
    autocmd!
    autocmd BufWinEnter * execute '%s/^/|\t'
"    autocmd InsertLeave * execute '%s/^/|\t'
    autocmd InsertEnter * execute '%s/^|\t//ge'
    autocmd BufWritePre * execute '%s/^|\t//ge'
augroup END
