packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('vim-jp/syntax-vim-ex')
call minpac#add('chriskempson/vim-tomorrow-theme')
call minpac#add('machakann/vim-highlightedyank')


colorscheme Tomorrow-Night
set inccommand=split "interactive preview with search replace 

