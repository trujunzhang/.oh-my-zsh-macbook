function! myspacevim#before() abort
    call SpaceVim#layers#load('lang#javascript', {'build': './install.sh'})
    nnoremap jk <Esc>
endfunction

function! myspacevim#after() abort
    iunmap jk
endfunction