function! myspacevim#before() abort
  let g:auto_save = 1  " enable AutoSave on Vim startup
  let g:auto_save_events = ["InsertLeave", "TextChanged"]
endfunction

function! myspacevim#after() abort

endfunction
