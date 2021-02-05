" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Use crtl + hjkl to resize windows
nnoremap <c-j>    :resize +2<CR>
nnoremap <c-k>    :resize -2<CR>
nnoremap <c-h>    :vertical resize +2<CR>
nnoremap <c-l>    :vertical resize -2<CR>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on alt+, and use zsh
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <silent> <a-,> :call OpenTerminal()<CR>

