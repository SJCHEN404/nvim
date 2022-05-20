" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|


"======================
"=== Enhance Editor ===
"======================

" 保证旧版插件的正常
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

let &t_ut=''
" 光标在上次关闭的时候的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"set mouse=a
set clipboard=unnamed 
set scrolloff=6

set bg=dark
let mapleader = " "
syntax on
set encoding=utf-8
set number
set relativenumber
"set norelativenumber
set cursorline
set wrap
set showcmd
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set wildmenu
set notimeout
set jumpoptions=stack

" save
imap <C-s> <Esc>:w<CR>a
map <C-s> :w<CR>

" set tab indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

noremap <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz
map S :w<CR>
map R :source $MYVIMRC<CR>
noremap U 5k
noremap E 5j
noremap H 5h
noremap L 5l
" Faster in-line navigation
noremap W 5w
noremap B 5b

" split
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>

" change split
noremap sv <C-w>t<C-w>H
noremap sh <C-w>t<C-w>K

noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

noremap <LEADER><up> :res +5<CR>
noremap <LEADER><down> :res -5<CR>
noremap <LEADER><left> :vertical resize-5<CR>
noremap <LEADER><right> :vertical resize+5<CR>

" tab
noremap tn :tabe<CR>
noremap th :-tannext<CR>
noremap tl :+tabnext<CR>

" creat HEAD
"autocmd BufNewFile *.cpp,*.py exec ":call SetTitle()"
"func! SetTitle()
"    call setline(1, "//========== SJCHEN ==========")
"    call append(line("."), "//File Name: " .expand("%s"))
"    call append(line(".")+1, "//Created Time: " .strftime("%c"))
"    call append(line(".")+2, "//==========================")
"    normal Go
"endfunc


" =======================
" ===  plugins  begin ===
" =======================

call plug#begin('~/.config/nvim/plugged')

" wildfire.vim
Plug 'gcmt/wildfire.vim'

" vim-surround
Plug 'tpope/vim-surround'

" vim-startify
Plug 'mhinz/vim-startify'

" file explorer
Plug 'preservim/nerdtree'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'

" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" debug
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-rust --enable-python --enable-c'}

"fzf

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 

" ale
Plug 'dense-analysis/ale'

" mbbill/undotree

Plug 'mbbill/undotree'

" gruvbox
Plug 'morhetz/gruvbox'

call plug#end()

" nerdcommenter
Plug 'preservim/nerdcommenter'


" =======================
" ===   plugins  end  ===
" =======================


" =================================
" ===   plugins  configuration  ===
" =================================

colorscheme gruvbox
let g:gruvbox_material_background = 'hard'
try
	colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

" ==== airline ====

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1


" ==== preservim/nerdtree ====
noremap tt :NERDTreeToggle<CR>


" ==== dense-analysis/ale ====
let b:ale_linters = {
      \ 'c++': ['clang++'],
      \ 'c': ['clang++'],
      \ 'python': ['pylint'],
  \}
let b:ale_fixers = {
      \ 'c++': ['clang++'],
      \ 'c': ['clang++'],
      \ 'python': ['pylint'],
      \ }


" ==== undotree ====
let g:undotree_DiffAutoOpen=0
noremap UT :UndotreeToggle<CR>

" ==== jackguo380/vim-lsp-cxx-highlight ====

hi default link LspCxxHlSymFunction cxxFunction
hi default link LspCxxHlSymFunctionParameter cxxParameter
hi default link LspCxxHlSymFileVariableStatic cxxFileVariableStatic
hi default link LspCxxHlSymStruct cxxStruct
hi default link LspCxxHlSymStructField cxxStructField
hi default link LspCxxHlSymFileTypeAlias cxxTypeAlias
hi default link LspCxxHlSymClassField cxxStructField
hi default link LspCxxHlSymEnum cxxEnum
hi default link LspCxxHlSymVariableExtern cxxFileVariableStatic
hi default link LspCxxHlSymVariable cxxVariable
hi default link LspCxxHlSymMacro cxxMacro
hi default link LspCxxHlSymEnumMember cxxEnumMember
hi default link LspCxxHlSymParameter cxxParameter
hi default link LspCxxHlSymClass cxxTypeAlias

" ==== neoclide/coc.nvim ====

" coc extensions
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-vimlsp',
      \ 'coc-cmake',
      \ 'coc-highlight',
      \ 'coc-pyright',
      \ 'coc-python',
      \ 'coc-snippets'
      \ ]

set updatetime=100
set shortmess+=c

set signcolumn=number

" <TAB> to select candidate forward or
" pump completion candidate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" <s-TAB> to select candidate backward
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.')-1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" <CR> to comfirm selected candidate
" only when there's selected complete item
if exists('*complete_info')
  inoremap <silent><expr> <CR> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-select)
let g:coc_snipper_next = '<c-k>'
let g:coc_snipper_prev = '<c-j>'
imap <C-j> <Plug>(coc-snippets-jump)
let g:snips_author = 'SJCHEN'

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" diagnostic info
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nmap <LEADER>qf <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ==== puremourning/vimspector ====
let g:vimspector_enable_mappings = 'HUMAN'

function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad




" ==================== wildfire ====================
nmap <leader>s <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }


"====================== fzf =========================

" open fzf
nnoremap <Leader>ff :FZF<CR>

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let $FZF_DEFAULT_OPT = '--layout=reverse'
let g:fzf_layout = { 'window': 'call OpenFloatingWin()'}

function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction


"========== preservim/nerdcommenter ==========



" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

