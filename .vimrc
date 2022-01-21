call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-commentary'
Plug 'beanworks/vim-phpfmt'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'ternjs/tern_for_vim'
Plug 'zefei/vim-wintabs'
Plug 'tell-k/vim-autopep8'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-dadbod'
Plug 'baverman/vial'
Plug 'baverman/vial-http'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[3 q"'
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[6 q"' |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | 
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"'
endif

:set hidden
:filetype plugin on
:set shiftwidth=2
:set autoindent
:set tabstop=2
:set expandtab
:set tags=tags
:set autoread
:set splitbelow
" :set foldmethod=indent
:set number
" :set autochdir

let NERDTreeQuitOnOpen=1
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1
let g:wintabs_display='statusline'
" let g:user_emmet_leader_key=','
let g:SuperTabCrMapping = 1
let g:ale_fixers = ['eslint','autopep8', 'yapf']

let mapleader = ","
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

:nnoremap <Leader>c :let @+=expand('%:p')<CR>
nnoremap <leader>ov :exe ':silent !code %'<CR>:redraw!<CR>
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" noremap m 7j

noremap ; :
noremap 8 ;
noremap q 7k
noremap m 7j
noremap [ <C-W>W
noremap <Tab> :WintabsNext<CR>
noremap <Backspace> :WintabsPrevious<CR>
noremap <Leader>d :WintabsClose<CR> 
noremap <Leader>t :NERDTreeToggle<CR>
noremap <Leader>f :Files<CR>
" noremap <Leader>a :ALEFix<CR>
" noremap <Leader>r :exe "!tmux send -t 0 'ls' Enter"<cr><c-l>
noremap <Leader>x :WintabsOnly<CR>
noremap 3 <C-O>za
nnoremap 3 za
onoremap 3 <C-C>za
vnoremap 3 zf
inoremap jj <Esc>

map <Leader> <Plug>(easymotion-prefix)
map f <Plug>(easymotion-bd-f)

command! E Explore
cnoreabbrev t  ALEToggle
cnoreabbrev ; Files

command! -bang -nargs=* Files call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

if has("autocmd")
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd InsertLeave * write
    autocmd BufLeave,FocusLost * silent! wall
endif

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap jj <C-\><C-n>
endif
