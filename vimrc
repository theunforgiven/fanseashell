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

"make sure vim loads apexcode filetype detection
runtime! bundle/vim-force.com/ftdetect/vim-force.com.vim
"settings for force.com plugin
"paths must be absolute for plugin to work properly
let g:apex_backup_folder="/home/sfdcdev/apex/backup"
let g:apex_temp_folder="/home/sfdcdev/apex/temp"
let g:apex_properties_folder="/home/sfdcdev/apex/properties"
let g:apex_tooling_force_dot_com_path="/home/sfdcdev/apex/tooling-jar/tooling-force.com-0.1.4.2-getCompilerErrors-fix.jar"

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

"Display buffer names for current tab at in the tab line of the screen when there is a
"single tab
let g:airline#extensions#tabline#enabled = 1

"when showing buffers in table line add buffer number to them
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'jellybeans'
let g:promptline_theme = 'jelly'
let g:promptline_powerline_symbols = 1
colorscheme jellybeans

"If we are in an apexcode file ignore all xml files when listing files in
"unite
autocmd FileType apexcode call unite#custom#source('file', 'ignore_pattern', '\.xml$')

"open unite for files in working dir
map <Leader>uf :Unite -start-insert file<CR>
"open unite for buffers
map <Leader>ub :Unite -start-insert buffer<CR>
"toggle nerd tree file browser
map <Leader>nt :NERDTreeToggle<CR>
"toggle deploy current apex file
map <Leader>tt :TagbarToggle<CR>
"jump to previous buffer
nnoremap <Leader><Leader> <C-^>

"setup tabs in apex class files
autocmd FileType apexcode set ts=4 sw=4 sts=4 et
"deploy current file to salesforce
autocmd FileType apexcode nnoremap <leader>ado :ApexDeployOne<CR>y<CR>
"format apex class files with astyle
autocmd BufNewFile,BufRead *.cls nmap <buffer> <F7> mz:%!astyle --mode=java --style=java --break-blocks --pad-oper --pad-header --add-brackets --max-code-length=120 --break-after-logical<CR>`z

function! ApexOpenTestAlternate()
  let new_file = ApexAlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! ApexAlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_test = match(current_file, 'Test.cls$') != -1
  let going_to_test = !in_test
  if going_to_test
    let new_file = substitute(new_file, '.cls$', 'Test.cls', '')
  else
    let new_file = substitute(new_file, 'Test.cls$', '.cls', '')
  endif
  return new_file
endfunction
function! ApexClassNameFromFile(filename)
  let class_name = a:filename
  let class_name = substitute(class_name, '.cls$', '', '')
  let class_name = substitute(class_name, '^.*\/', '', '')
  return class_name
endfunction
"open test for apex code file
autocmd FileType apexcode nnoremap <Leader>. :call ApexOpenTestAlternate()<CR>

function! ApexMapCR()
  nnoremap <Leader>t :call ApexRunTestFile()<CR>
endfunction

autocmd FileType apexcode call ApexMapCR()

function! ApexRunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), 'Test.cls$') != -1
    if in_test_file
        call ApexSetTestFile()
    elseif !exists("t:apex_test_file")
        return
    end
    call ApexRunTests(t:apex_test_file . command_suffix)
endfunction

function! ApexSetTestFile()
    " Set the spec file that tests will be run for.
    let t:apex_test_file=@%
endfunction

function! ApexRunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    let class_name = ApexClassNameFromFile(a:filename)
    exec ":ApexTest testAndDeploy " . class_name
endfunction

"auto remove trailing whitespace in apex class files
autocmd BufWritePre *.cls :%s/\s\+$//e

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
