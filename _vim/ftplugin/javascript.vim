" My local javascript closing parens and braces plugin
" Last Change: 2015 March 18
" Maintainer: Wirianto Djunaidi <wirianto.djunaidi@gmail.com>
" License: This file is placed in the public domain.

let s:save_cpo = &cpo
set cpo&vim

if (exists("b:did_dj_js_plugin"))
  finish
endif
let b:did_dj_js_plugin = 1

if !exists("*s:HasCloseParens")
  function s:HasCloseParens()
    let char = matchstr(getline('.'), '\%' . col('.'). 'c.')
    return char == ")"
  endfunction
endif

inoremap <buffer> <silent> { {<CR>}<Esc><S-o>
inoremap <buffer> <silent> ; <ESC><S-a>;
inoremap <buffer> <silent> ( ()<Esc>i

noremap <script> <SID>HasCloseParens :call <SID>HasCloseParens()<CR>
inoremap <buffer> <silent> ) <C-R>=<SID>HasCloseParens() ? '<C-O><S-a>' : ') '<CR>

let &cpo = s:save_cpo
