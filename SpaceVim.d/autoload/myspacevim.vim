function! myspacevim#before() abort
  # call SpaceVim#layers#load('lang#html')
  # call SpaceVim#layers#load('lang#javascript', {'build': './install.sh'})
  # nnoremap jk <Esc>
  # call SpaceVim#custom#SPCGroupName(['f','p'], 'Prettier')
  # call SpaceVim#custom#SPC('Prettier', ['g', 'p'], 'Prettier', 'Format Javascript', 1)
endfunction

function! myspacevim#init() abort
  call SpaceVim#layers#load('lang#html')
  call SpaceVim#layers#load('lang#javascript', {'build': './install.sh'})
endfunction

function! myspacevim#after() abort
    iunmap jk
endfunction
