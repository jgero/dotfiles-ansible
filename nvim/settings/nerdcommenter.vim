" switch the file type back and forth when in a svelte file to get the correct comments

fu! NERDCommenter_before()
  if (&ft == 'html') || (&ft == 'svelte')
    let g:ft = &ft
    let cfts = context_filetype#get_filetypes()
    if len(cfts) > 0
      if cfts[0] == 'svelte'
        let cft = 'html'
      elseif cfts[0] == 'scss'
        let cft = 'css'
      else
        let cft = cfts[0]
      endif
      exe 'setf ' . cft
    endif
  endif
endfu

fu! NERDCommenter_after()
  let g:ft = &ft
  if (g:ft == 'html') || (g:ft == 'svelte')
    exec 'setf ' . g:ft
    g:ft = ''
  endif
endfu
