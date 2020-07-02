" Redefine conflicting vim wiki binding
let g:vimwiki_map_prefix = '<Leader><Leader>w'
nmap # <Plug>VimwikiAddHeaderLevel
nmap <C-]> <Plug>VimwikiFollowLink
nmap <C-T> <Plug>VimwikiGoBackLink
" let g:vimwiki_list = []
" let g:riv_global_leader = '<Leader>ee'
" let g:vimwiki_conceallevel = 1
" let g:rst_fold_enabled=1
" let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#filetypes#handled = ["pandoc", "rst"]
let g:pandoc#filetypes#pandoc_markdown = 1
" let g:pandoc#syntax#conceal#blacklist = ["atx", "list"]
let g:pandoc#syntax#conceal#blacklist = ["list"]
let g:pandoc#keyboard#enabled_submodules = ["lists", "references", "styles", "sections", "links", "checkboxes"]
let g:pandoc#spell#enabled = 0
" why the underlines in the file
" let g:pandoc#syntax#conceal#urls = 1;
"g:pandoc#keyboard#sections#header_style
"g:pandoc#hypertext#open_cmd
"g:pandoc#toc#position

nmap # <Plug>VimwikiAddHeaderLevel
nmap <C-]> <Plug>VimwikiFollowLink
nmap <C-T> <Plug>VimwikiGoBackLink