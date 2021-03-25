set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
let g:go_version_warning = 0
let g:coc_disable_startup_warning = 1

let g:python3_host_prog = $GLOBALINSTALLDIR . "/apps/nvim-py3/bin/python3"




"----------------------------------------------------------
" Plug
" Initialize plugin system
"----------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'vigoux/LanguageTool.nvim'
Plug 'rhysd/vim-grammarous/'
Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'
Plug 'dpelle/vim-LanguageTool'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'sedm0784/vim-you-autocorrect'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()


"----------------------------------------------------------
" Shortcuts
"----------------------------------------------------------
"----------------------------------------------------------
" Config
"----------------------------------------------------------
let g:mkdp_auto_start = 0



"------------------------------------
" Extra settings
"------------------------------------
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
map <C-c> "*y     " Yank current selection into system clipboard
nmap <C-c> "*Y     " Yank current line into system clipboard (if nothing is selected)
nmap <C-v> "*p     " Paste from system clipboard
" Create markmap from the whole file
nmap <Leader>m <Plug>(coc-markmap-create)
" Create markmap from the selected lines
vmap <Leader>m <Plug>(coc-markmap-create-v)" 
" Markdown preview option
nmap <c-w> <Plug>MarkdownPreviewToggle
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Ack setting

let g:ack_autofold_results = 0
map <leader>a :Ack 


function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" ---------------------------------------------------------------------
" Netrw
" ---------------------------------------------------------------------
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 15


" ---------------------------------------------------------------------
" Coc vim
" ---------------------------------------------------------------------
" Use C to open coc config
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')

" ---------------------------------------------------------------------
"  Cvim Csupport setting
"  --------------------------------------------------------------------
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'


" ------------------
"  Grammrous Shortcut setting
"  -------------------

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
endfunction

let g:grammarous#languagetool_cmd = 'languagetool'

" ------
"  auto save config
"  ------
autocmd CursorHold,CursorHoldI * update



" -------------
"  language tool setting up
" ------------

let g:languagetool_server_jar="/usr/local/opt/languagetool/libexec/languagetool-server.jar"

