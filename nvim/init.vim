source $VIM/plugins.vim

" Abbreviations:

abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter


" VIM CONFIGS {:

if &compatible
  set nocompatible
endif

set autoread                " detect when a file is changed
set history=500
set textwidth=120
set path+=**

set nobackup
set nowb
set noswapfile

set scrolloff=4
set clipboard=unnamed
set laststatus=2
set notimeout
set number
set relativenumber

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
if (has('nvim'))
	" show results of substition as they're happening
	" but don't open a split
	set inccommand=nosplit
endif
" }

" UI:
syntax on
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
if (empty($TMUX) && has("termguicolors"))
    set termguicolors
endif

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection=0

try
   colorscheme gruvbox
catch
endtry

set background=dark

" Syntax

set wrap                    " turn on line wrapping
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set noexpandtab             " insert tabs rather than spaces for <Tab>
set foldmethod=syntax       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1





" Map the leader key to SPACE
let mapleader = "\ "
let g:mapleader = "\ "
" wildmenu
set wildmenu
set wildignore=*.o,*~,*.pyc

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" KeyMap:
vnoremap <C-c> "*y
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

nmap <leader>w :w!<cr>
nmap <leader>o o<Esc>x
nmap <leader>O O<Esc>x

" Disable highlight when
map <silent> <leader>n :noh<cr>

" Useful mappings for managing tabs
" map <leader>t :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>q :tabclose<cr>
map <leader>k : tabprev<cr>
map <leader>j :tabnext<cr>
map <leader>t :tabedit <c-r>=expand("%:p:h")<cr>/

" Move between splits easier
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h


map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

map <leader>l :NERDTreeToggle<CR>
" TAG JUMPING

" create the `tags` file (need ctags)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tag
" - Use ^t to jump back to tag stack
" - NOT VISUAL

" FILE BROWSING

let g:netrw_banner=0		" disable annoying banner
let g:netrw_browse_split=4	"open in proir window
let g:netrw_altv=1		"open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\/\S\+'


" Snippits:

nnoremap <Leader>html :-read $HOME/.vim/.snippits/.main.html<CR>11jA


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
"Open with NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Open with NERDTree

" Vim-TS
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"VIM-JS-Pretty
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces


" Close only nerdtree window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd FileType ts setlocal commentstring=//\ %s

"fix TS file
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" " TSuquyomi
" let g:tsuquyomi_completion_detail = 1
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" Junk

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

"autocmd FileType typescript setlocal completeopt-=menu " remove card for
"autocompelete
autocmd FileType typescript setlocal completeopt+=menu,preview
