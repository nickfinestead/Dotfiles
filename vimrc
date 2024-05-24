set number

augroup insert_and_remove_before_every_line
    autocmd!
    autocmd BufWinEnter * execute '%s/^/|\t'
    autocmd InsertLeave * execute '%s/^/|\t'
    autocmd InsertEnter * execute '%s/^|\t//g'
    autocmd BufWritePre * execute '%s/^|\t//g'
augroup END
