"---------- OmniComplete on keypress ----------"

if exists("g:loaded_auto_omnicomplete")
  finish
endif
let g:auto_omnicomplete_key =
            \ 'a b c d e f g h i j k l m n o p q r s t u v w x y z ' .
            \ 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z'

" set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone

" Keys that trigger completeopt
autocmd BufNewFile,BufRead * call Bind()
func! Bind()
    if exists('&omnifunc') && &omnifunc != ""
        call auto_omni#bind()
    endif
endfunc

" Completion of . and :
inoremap <silent><expr> / "/\<C-X>\<C-F>"

set completeopt=noinsert,menuone

