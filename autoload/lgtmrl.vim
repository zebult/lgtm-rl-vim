"=============================================================================
" File: lgtm-rl-vim.vim
" Author: saichi
" Created: 2018-07-19
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_lgtmrl')
    finish
endif
let g:loaded_lgtmrl = 1

let s:save_cpo = &cpo
set cpo&vim

" initialize "{{{
if !exists("g:lgtm_random_list_count")
  let g:lgtm_random_list_count = 5
endif

let spath = expand('<sfile>:p')
let s:cs_script = spath[0 : strridx(spath, 'autoload') - 1] . 'bin/lgtm.exe'
"}}}

" public functions "{{{
function! lgtmrl#put() abort
  let command = 'mono '.s:cs_script.' '.g:lgtm_random_list_count
  let result = system(command)
  put =result
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo
