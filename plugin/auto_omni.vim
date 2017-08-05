"---------- OmniComplete on keypress ----------"

if exists("g:loaded_auto_omni")
  finish
endif
let g:loaded_auto_omni=1
if !exists("g:auto_omni_key")
    let g:auto_omni_key =
                \ 'a b c d e f g h i j k l m n o p q r s t u v w x y z ' .
                \ 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z'
endif

" set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone

" Keys that trigger completeopt
autocmd BufNewFile,BufRead * call AutoOmniBind()
func! AutoOmniBind()
    if exists('&omnifunc') && &omnifunc != ""
        call auto_omni#bind()
    endif
endfunc
command! -nargs=0 -bar AutoOmniLock
      \ call auto_omni#_lock()
command! -nargs=0 -bar AutoOmniUnlock
      \ call auto_omni#_unlock()

" Completion of . and :
inoremap <silent><expr> / "/\<C-X>\<C-F>"

set completeopt=noinsert,menuone

