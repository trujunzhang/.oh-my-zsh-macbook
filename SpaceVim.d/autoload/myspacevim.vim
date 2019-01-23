function! myspacevim#before() abort
    nnoremap jk <Esc>
endfunction

function! myspacevim#after() abort
    iunmap jk
endfunction