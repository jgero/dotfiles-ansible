" where to save session files
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Files']            },
  \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ ]

" when starting vim use vcx root as 'current working directory'
let g:startify_change_to_vcs_root = 1
