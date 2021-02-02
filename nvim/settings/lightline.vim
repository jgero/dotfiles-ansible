" set this to hide -- INSERT -- and so on from normal status line
set noshowmode

" show ordinal buffers
let g:lightline#bufferline#show_number = 2
" use devicons
let g:lightline#bufferline#enable_devicons = 1

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ 'tabline': {
  \   'left': [ ['buffers'] ],
  \   'right': [ ]
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel'
  \ }
\ }

