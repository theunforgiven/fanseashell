" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Lokaltog/powerline-fonts.git'
NeoBundle 'Lokaltog/vim-easymotion.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimproc.vim.git', { 'build' : { 'linux' : 'make', 'mac' : 'make' } }
NeoBundle 'airblade/vim-gitgutter.git'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'edkolev/promptline.vim.git'
NeoBundle 'edkolev/tmuxline.vim.git'
NeoBundle 'elzr/vim-json.git'
NeoBundle 'jelera/vim-javascript-syntax.git'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'nanotech/jellybeans.vim.git'
NeoBundle 'plasticboy/vim-markdown.git'
NeoBundle 'scrooloose/nerdtree.git', { 'augroup' : 'NERDTreeHijackNetrw'}
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'tpope/vim-fugitive.git', { 'augroup' : 'fugitive'}
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-sensible.git'
NeoBundle 'chriskempson/base16-vim.git'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

set t_Co=256
set encoding=utf-8
set nocompatible
syntax enable
filetype plugin on

"enable spellcheck
set spell spelllang=en_us

set smartcase

"enable scrolling in iterm2
set mouse=a
set clipboard=unnamed

"always show status line
set laststatus=2

"allow you to hide buffer without saving it
set hidden

"enable line numbers
set number

"prevent airline from causing pauses
"this also effects how long you have after
"hitting the leader key to hit the next key
set timeoutlen=500

"hold a lot of history
set history=5000

"do not show mode below status line - airline does that
set noshowmode

"highlight current line
set cursorline

" enable airline for fugitive
let g:airline#extensions#branch#enabled = 1

"Display buffer names for current tab at in the tab line of the screen when there is a
"single tab
let g:airline#extensions#tabline#enabled = 1

"when showing buffers in table line add buffer number to them
let g:airline#extensions#tabline#buffer_nr_show = 1

set background=dark
colorscheme base16-chalk

let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#promptline#enabled = 0

let g:airline_theme = 'base16'
let g:promptline_theme = 'airline'
let g:tmuxline_theme = 'airline'

let g:airline_powerline_fonts=1
let g:promptline_powerline_symbols = 1
let g:tmuxline_powerline_separators = 1

let airline#extensions#tmuxline#snapshot_file = "~/.fanseashell/fancy/tmuxline.tmux.conf"
let airline#extensions#promptline#snapshot_file = "~/.fanseashell/fancy/promptline.sh"

"disable markdown plugin auto folding
let g:vim_markdown_folding_disabled=1

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

"enable logging of yanks for unite
let g:unite_source_history_yank_enable = 1

"open unite for yank history
map <leader>uy :<C-u>Unite history/yank<CR>
"open unite for files in working dir
map <Leader>uf :Unite -start-insert file_rec/async<CR>
"open unite for buffers
map <Leader>ub :Unite -quick-match buffer<CR>
"toggle nerd tree file browser
map <Leader>nt :NERDTreeToggle<CR>
"toggle deploy current file
map <Leader>tt :TagbarToggle<CR>
"jump to previous buffer
nnoremap <Leader><Leader> <C-^>

"reformat entire file
map <Leader>rf mzgg=G`z<CR>

"Automatically enter paste mode when pasting into VI in insert mode and exit
"paste mode after paste is finished
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"make vim goto last position in file when a file is reopened
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable default mappings
let g:EasyMotion_do_mapping = 0

" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1

" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

map s <Plug>(easymotion-s2)

"toggle showing whitespace
map <F12> :set list!<CR>

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

if v:version >= 700
  autocmd BufLeave * let b:winview = winsaveview()
  autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
