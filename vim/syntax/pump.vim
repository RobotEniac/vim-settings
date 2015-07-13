if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Read the c++ syntax to start with
if version < 600
    "  so <sfile>:p:h/cpp.vim
else
    "  runtime! syntax/cpp.vim
    "  unlet b:current_syntax
endif

syn case match

syn match pumpComment "\$\$.*$"
syn match pumpVariable "\$\w\+"
syn match pumpKeyword "$\(var\|for\|range\|if\|else\|elif\)"
syn match pumpBlock "\(\[\[\)\|\(\]\]\)"

if version >= 508 || !exists("did_pump_syn_inits")
    if version < 508
        let did_pump_syn_inits = 1
        command! -nargs=+ HiLink hi link <args>
    else
        command! -nargs=+ HiLink hi def link <args>
    endif

    HiLink pumpKeyword      Keyword
    HiLink pumpVariable     Identifier
    HiLink pumpComment      Comment
    HiLink pumpBlock        Special
    delcommand HiLink
endif

let b:current_syntax = "pump"

