" Highlight yank
au TextYankPost * silent! lua vim.highlight.on_yank()

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

nmap <leader>t :call TrimWhitespace()<CR>
