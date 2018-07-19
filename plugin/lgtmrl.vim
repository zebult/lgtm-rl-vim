"=============================================================================
" File: lgtm-rl-vim.vim
" Author: saichi
" Created: 2018-07-19
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_lgtmrl')
    finish
endif
let g:loaded_lgtmrl = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 LGTMRL :call lgtmrl#put()

let &cpo = s:save_cpo
unlet s:save_cpo
