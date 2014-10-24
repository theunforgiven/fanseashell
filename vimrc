"force 256 color mode to prevent terminal detection failure from breaking 256
"color support
set t_Co=256
set encoding=utf-8
set nocompatible
syntax on
filetype plugin on
filetype plugin indent on

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"enable spellcheck
set spell spelllang=en_us

set smartcase

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

"Display buffer names for current tab at in the tab line of the screen when there is a
"single tab
let g:airline#extensions#tabline#enabled = 1

"when showing buffers in table line add buffer number to them
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:tmuxline_theme = 'jellybeans'
let g:promptline_theme = 'jelly'
let g:promptline_powerline_symbols = 1
colorscheme jellybeans

"This will cause tmux and prompt theme files to be generated
"i perfer the current blend of themes so these are commented out
let g:airline#extensions#tmuxline#enabled = 0 
"let airline#extensions#tmuxline#snapshot_file = "~/.fanseashell/fancy/tmuxline.tmux.conf"
"let airline#extensions#promptline#snapshot_file = "~/.fanseashell/fancy/promptline.sh"

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\K'
        return "\<TAB>"
    else
        return "\<C-P>"
    endif
endfunction
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
inoremap <S-TAB> <C-N>

"Automatically enter paste mode when pasting into VI in insert mode and exit
"paste mode after paste is fiished
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

set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
"toggle showing whitespace
map <F11> :set list!<CR>

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
