function! myspacevim#before() abort
  # call SpaceVim#layers#load('lang#html')
  # call SpaceVim#layers#load('lang#javascript', {'build': './install.sh'})
  # nnoremap jk <Esc>
  # call SpaceVim#custom#SPCGroupName(['f','p'], 'Prettier')
  # call SpaceVim#custom#SPC('Prettier', ['g', 'p'], 'Prettier', 'Format Javascript', 1)
  call SpaceVim#custom#SPC('nmap', ['c','c'], '<Plug>NERDCommenterInvert', 'comment or uncomment lines', 0)
  # call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'c'], 'TSTypeDef', 'type definition', 1)
   nnoremap <silent><D-b> :TSTypeDef<CR>

endfunction

function! myspacevim#init() abort
  " call SpaceVim#layers#load('lang#html')
  " call SpaceVim#layers#load('lang#javascript', {'build': './install.sh'})
endfunction

function! myspacevim#after() abort
    iunmap jk
endfunction
i
