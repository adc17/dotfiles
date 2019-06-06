""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>pp :let g:parinfer_mode = "paren"<cr>
nnoremap <leader>pi :let g:parinfer_mode = "indent"<cr>
nnoremap <leader>ps :let g:parinfer_mode = "smart"<cr>
" not a real mode, but stops plugin from running
nnoremap <leader>po :let g:parinfer_mode = "off"<cr>

" reverse vim-clojure-static behaviour (I don't know why it messes with this, but if I realize I might change it back)
augroup clojure
  autocmd!
  autocmd FileType clojure set iskeyword-=?,*,!,+,/,=,<,>,.,:,$ 
augroup END

" Indentation settings
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['.*']
let g:clojure_fuzzy_indent_blacklist = ['->', ':require']

" Refresh repl
function! s:Refresh(bang,ns)
  let cmd = ('(clojure.tools.namespace.repl/refresh'.(a:bang ? '-all' : '').')')
  echo cmd
  try
    call fireplace#session_eval(cmd)
    return ''
  catch /^Clojure:.*/
    return ''
  endtry
endfunction

function! s:setup_refresh()
  command! -buffer -bar -bang -complete=customlist,fireplace#ns_complete -nargs=? Refresh :exe s:Refresh(<bang>0, <q-args>)
  nnoremap <silent><buffer> cpf :Refresh<CR>
endfunction

augroup fireplace_refresh
  autocmd!
  autocmd FileType clojure call s:setup_refresh()
augroup END


" https://github.com/bhauman/lein-figwheel/wiki/Using-the-Figwheel-REPL-with-Vim
" Begin connection to figwheel repl: :Connect<cr>

" Treat pixie like clojure
augroup pixie
  autocmd!
  autocmd BufNewFile,BufRead *.pxi set filetype=clojure
augroup END

" Source
" open: ]<C-D>
" split <C-W>d 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline config for parinfer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (exists('g:parinfer_airline_integration') ? g:parinfer_airline_integration : 1)
  function! ParinferAirline(...)
    if &filetype =~ '.*\(clojure\|scheme\|lisp\|racket\|hy\).*'
      let w:airline_section_a = g:airline_section_a . ' %{g:parinfer_mode}'
    endif
  endfunction

  try
    call airline#add_statusline_func('ParinferAirline')
  catch
  endtry
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow Parens
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,elisp,racket,clojure,scheme RainbowParentheses
augroup END
