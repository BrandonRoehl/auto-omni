func! auto_omni#bind()
    for key in split(g:auto_omnicomplete_key)
        execute "inoremap <buffer><silent><expr> ".key." \"".key."\" . auto_omni#open()"
    endfor
    inoremap <buffer><silent><expr> . ".\<C-X>\<C-O>"
    inoremap <buffer><silent><expr> : ":\<C-X>\<C-O>"
    " Tab insert
    inoremap <buffer><silent><expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"

endfunc

func! auto_omni#open()
    if !pumvisible()
        return "\<C-X>\<C-O>"
    else
        return ''
    endif
endfunc

