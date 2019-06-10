" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-commentary'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
    
:set shiftwidth=5
:set autoindent
:set tabstop=4
:set expandtab
:set tags=tags
:set autoread
:set relativenumber

let g:user_emmet_leader_key=','
let g:SuperTabCrMapping = 1
let mapleader = ","
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

nnoremap ; :
noremap m 7j
noremap 8 7k

map <Leader> <Plug>(easymotion-prefix)

command! E Explore
cnoreabbrev t  NERDTreeToggle
cnoreabbrev ; Files

command! -bang -nargs=* Files call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

if has("autocmd")
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd InsertLeave * write
endif
