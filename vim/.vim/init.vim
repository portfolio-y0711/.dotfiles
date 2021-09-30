"cd /Users/yoonsung0711/git/
" $HOME/.vimrc
:set directory=$HOME/.vim/swapfiles//

nnoremap <leader>cd :cd %:p:h<CR>

set tabstop=4
set sw=4
set expandtab
set linespace=3
set softtabstop=4
set smartindent
set encoding=UTF-8

"augroup ProjectDrawer
    "autocmd!
    "autocmd VimEnter * if argc() == 0 | Explore! | endif
"augroup END

"hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=white
hi LineNr ctermfg=grey

set cursorline
"hi cursorline cterm=none term=none ctermbg=darkgrey
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline



highlight LineNr ctermfg=darkyellow ctermbg=black


nnoremap <silent> <F2> :RelativizeToggle<CR>

nnoremap <silent> <F3> :let [&number, &relativenumber] =
  \ [!&number && (g:relativize_with_number \|\| !g:relativize_enabled),
  \ !&relativenumber && g:relativize_enabled]<CR>

set laststatus=0

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set laststatus=0
    else
        let s:hidden_all = 0
        set laststatus=2
    endif
endfunction

nnoremap <silent> <F4> :call ToggleHiddenAll()<CR>

set nocursorline
fu! ToggleCurline ()
  if &cursorline
    set nocursorline
  else
    set cursorline
  endif
endfunction

nnoremap <silent><F5> :call ToggleCurline()<CR>

set nocursorcolumn
fu! ToggleCurcolumn ()
  if &cursorcolumn
    set nocursorcolumn
  else
    set cursorcolumn
  endif
endfunction

nnoremap <silent><F6> :call ToggleCurcolumn()<CR>


call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ericbn/vim-relativize'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tbabej/taskwiki'
"Plug 'itchyny/lightline.vim'

"
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'gcmt/taboo.vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'

call plug#end()

set guioptions-=e
set sessionoptions+=tabpages,globals

let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeGitStatusWithFlags = 1
"colorscheme gruvbox

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ } 

let g:NERDTreeSyntaxEnabledExtensions = []

"let g:lightline = {
"\ 'colorscheme': 'seoul256'
"\}

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <F2> <Plug>(coc-rename)

command! -nargs=0 Prettier :CocCommand prettier.formatFile

colorscheme gruvbox

nmap <C-n> :NERDTreeToggle<CR>

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

let mapleader = ","
nmap <leader>ne :NERDTree<cr>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

let g:taboo_tab_format="[%N] %f %m"

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-t> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-t> :exe "tabn ".g:lasttab<cr>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

autocmd VimEnter * NERDTree | wincmd p

"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1


"vim-wiki 설정
let g:vimwiki_list = [
    \{
    \   'path': '~/git_main/docs/portfolio-y0711.github.io/_wiki',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \},
    \{
    \   'path': '~/git_main/docs/yoonsung0711.github.io/_wiki',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \},
\]

" g:vimwiki_list 경로에 있지 않은 *.md 파일을 모두 vimwiki 형식으로 인식하는 문제 해결

let g:vimwiki_global_ext = 0

" vimwiki의 conceallevel 을 끄는 쪽이 좋다
let g:vimwiki_conceallevel = 0

" 자주 사용하는 vimwiki 명령어에 단축키를 취향대로 매핑해둔다
command! WikiIndex :VimwikiIndex
nmap <LocalLeader>ww <Plug>VimwikiIndex
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>wt :VimwikiTable<CR>

" F4 키를 누르면 커서가 놓인 단어를 위키에서 검색한다.
nnoremap <F4> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>

" Shift F4 키를 누르면 현재 문서를 링크한 모든 문서를 검색한다
nnoremap <S-F4> :execute "VWB" <Bar> :lopen<CR>


"let wiki = {}
"let wiki.path = '~/git_main/docs/portfolio-y0711.github.io/_wiki'
"let wiki.ext = '.md'

"let g:vimwiki_list = [wiki]
"let g:vimwiki_conceallevel = 0
