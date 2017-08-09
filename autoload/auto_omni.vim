func! auto_omni#bind()
    for key in split(g:auto_omni_key)
        execute "inoremap <buffer><silent><expr> ".key." \"".key."\" . auto_omni#open()"
    endfor
    " Completion of . and :
    inoremap <buffer><silent><expr> / auto_omni#_locked() ? "/" : "/\<C-X>\<C-F>"
    " Tab insert
    inoremap <buffer><silent><expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
endfunc

func! auto_omni#open()
    if !pumvisible() && !auto_omni#_locked() && !&paste
        return "\<C-X>\<C-O>"
    else
        return ''
    endif
endfunc

func! auto_omni#_locked()
    return s:auto_omni_lock == 1
endfunc
func! auto_omni#_lock()
    let s:auto_omni_lock=1
endfunc
func! auto_omni#_unlock()
    let s:auto_omni_lock=0
endfunc
call auto_omni#_unlock()

" Called once right before you start selecting multiple cursors
func! Multiple_cursors_before()
    call auto_omni#_lock()
endfunc

" Called once only when the multiple selection is canceled (default <Esc>)
func! Multiple_cursors_after()
    call auto_omni#_unlock()
endfunc

