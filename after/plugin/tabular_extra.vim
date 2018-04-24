" Provides extra :Tabularize commands

if !exists(':Tabularize')
    finish " Give up here; the Tabular plugin musn't have been loaded
endif

" Make line wrapping possible by resetting the 'cpo' option, first saving it
let s:save_cpo = &cpo
set cpo&vim

"AddTabularPattern! asterisk /*/l1
AddTabularPattern! first_equals /^[^,]*\zs,/

AddTabularPipeline! remove_leading_spaces /^ /
            \ map(a:lines, "substitute(v:val, '^ *', '', '')")

" Restore the saved value of 'cpo'
let &cpo = s:save_cpo
unlet s:save_cpo

" vim: ft=vim et ts=4 sw=4:
