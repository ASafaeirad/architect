if &compatible
  set nocompatible
endif
set runtimepath+={path to dein.vim directory}

if dein#load_state({path to plugin base path directory})
  call dein#begin({path to plugin base path directory})

  call dein#add({path to dein.vim directory})
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  ...

  call dein#end()
  call dein#save_state()
endif

