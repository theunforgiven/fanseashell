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

"open unite for files in working dir
map <Leader>uf :Unite file<CR>
"open unite for buffers
map <Leader>ub :Unite buffer<CR>
"toggle nerd tree file browser
map <Leader>tn :NERDTreeToggle<CR>
"toggle deploy current apex file
map <Leader>tt :TagbarToggle<CR>

"deploy current file to salesforce
map <Leader>ado :ApexDeployOne<CR>y<CR>

"size of a hard tabstop
set tabstop=4

"size of an "indent"
set shiftwidth=4

"a combination of spaces and tabs are used to simulate tab stops at a width
"other than the (hard)tabstop
set softtabstop=4

"map <Leader>rf
map <Leader>rf mzgg=G`z<CR>
