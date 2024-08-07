scriptencoding utf-8
set encoding=utf-8
""""" vim-plug Setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ariel-miculas/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'RRethy/vim-illuminate'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'andymass/vim-matchup'
Plug 'kana/vim-textobj-user'
Plug 'AndrewRadev/sideways.vim'
Plug 'mphe/grayout.vim'
Plug 'rust-lang/rust.vim'
Plug 'LnL7/vim-nix'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on

augroup vimrc
    " Remove all vimrc autocommands
    autocmd!

    " " Automatic reloading of .vimrc
    " autocmd! bufwritepost .vimrc source %

    " Return to the last edit position when opening files
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

    " Disable automatic comment insertion
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " This trigger takes advantage of the fact that the quickfix window can be
    " easily distinguished by its file-type, qf. The wincmd J command is
    " equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
    " the very bottom (see :help :wincmd and :help ^WJ).
    autocmd FileType qf wincmd J

    " comments in assembly are marked by ';'
    autocmd FileType asm setlocal commentstring=;\ %s
    autocmd FileType masm setlocal commentstring=;\ %s
    autocmd FileType nasm setlocal commentstring=;\ %s

    autocmd BufEnter *.asm setlocal filetype=masm
    autocmd BufEnter *.masm setlocal filetype=masm

    " Latex: set textwidth to 120 and enable auto-wrapping
    " t Auto-wrap text using textwidth
    " c Auto-wrap comments using textwidth, inserting the current comment
    "   leader automatically.
    autocmd FileType tex,plaintex setlocal fo+=tc textwidth=120

    " Set yapf as the python formatter
    if executable('yapf')
        autocmd FileType python setlocal equalprg=yapf
    endif

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

    autocmd FileType c,cpp call LoadCscope()
augroup END

" Show trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" unhiglight search
imap <silent> <c-c> <ESC>:nohlsearch<CR>a
nmap <silent> <c-c> :nohlsearch<CR>

noremap  <F4> :set cursorline! cursorcolumn!<CR>
inoremap <F4> <ESC>:set cursorline! cursorcolumn!<CR>i

" Toggle last buffers with backspace
nnoremap <Backspace> <C-^>

function! GrayoutToggle()
    if !exists("b:grayoutEnabled")
      let b:grayoutEnabled=0
    endi
    if b:grayoutEnabled
        exec 'GrayoutClear'
        let b:grayoutEnabled=0
        echo 'Grayout disabled'
    else
        exec 'GrayoutUpdate'
        let b:grayoutEnabled=1
        echo 'Grayout enabled'
    endif
endfunction

nnoremap yog :call GrayoutToggle()<cr>

function! TabToggle()
    if &expandtab
        set noexpandtab
    else
        set expandtab
    endif
endfunction

nmap <F9> :call TabToggle()<cr>

function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
        " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endfunction

function! GoFmt()
  let saved_view = winsaveview()
  silent %!gofmt
  if v:shell_error > 0
    cexpr getline(1, '$')->map({ idx, val -> val->substitute('<standard input>', expand('%'), '') })
    silent undo
    cwindow
  endif
  call winrestview(saved_view)
endfunction

command! GoFmt call GoFmt()


set cindent
set cinoptions+=g0

set backspace=2
set laststatus=2
set ruler               " show line and column number
syntax on               " syntax highlighting

set relativenumber      " show line numbers
set number
set nowrap              " don't automatically wrap on load
set fo-=t               " don't automatically wrap text when typing

set history=700
set undolevels=700

" make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" default flag for search/replace
set gdefault

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Automatic reload of files from disk
set autoread

if has('persistent_undo')
  " tell it to use an undo file
  if isdirectory($HOME.'/.vim/undo')
    " set a directory to store the undo history
    set undofile
    set undodir=~/.vim/undo/
  else
    echoerr "~/.vim/undo doesn't exist!"
  endif
endif

let $BASH_ENV = "~/.bash_aliases"

" make space the leader key
let mapleader = " "

" press jk instead of ESC to exit insert mode
inoremap jk <esc>

" fix spellchecking for the gruvbox colorscheme
let g:gruvbox_guisp_fallback = "bg"
" Color Scheme
colorscheme gruvbox
set background=dark
set termguicolors

" ctags stuff
set tags=tags;

" cscope stuff
set cscopeverbose
set cscopequickfix=s-,c-,d-,i-,t-,e-

nnoremap <leader>ga :cs find a <C-R>=expand("<cword>")<cr><cr>
nnoremap <leader>gs :cs find s <C-R>=expand("<cword>")<cr><cr>
nnoremap <leader>gd :cs find g <C-R>=expand("<cword>")<cr><cr>
nnoremap <leader>gr :cs find c <C-R>=expand("<cword>")<cr><cr>
nnoremap <leader>gt :cs find t <C-R>=expand("<cword>")<cr><cr>
nnoremap <leader>ge :cs find e <C-R>=expand("<cword>")<cr><cr>
nnoremap <leader>gf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nnoremap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<cr>$<cr>
nnoremap <leader>gg :cs find d <C-R>=expand("<cword>")<cr><cr>

" configure the foldmethod
set foldmethod=syntax

" ensure that the files open without any folds
set foldlevelstart=99

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" vim buffers
set hidden
set wildchar=<Tab> wildmenu wildmode=full

" this is already mapped by default
":nnoremap <Tab> <C-i>
nnoremap <S-Tab> <C-o>

" Make Y command logical
nnoremap Y y$

" Convert each NameLikeThis to name_like_this in current line.
" :s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<c-u>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<cr>
      \gvy/<c-r>=&ic?'\c':'\C'<cr><c-r><c-r>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
      \gVzv:call setreg('"', old_reg, old_regtype)<cr>
vnoremap <silent> # :<c-u>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<cr>
      \gvy?<c-r>=&ic?'\c':'\C'<cr><c-r><c-r>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
      \gVzv:call setreg('"', old_reg, old_regtype)<cr>

" vim-grepper mappings
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

let g:grepper = {}
let g:grepper.tools = ['rg']
let g:grepper.open = 0
let g:grepper.jump = 1

let g:grepper.rg = {'grepprg': 'rg --vimgrep --no-heading --smart-case -tc -tcpp -tpy -tsh -trust -ttoml -tgo',
      \ 'grepformat': '%f:%l:%c:%m,%f:%l:%m'}

command! Todo GrepperRg '(TODO|FIXME|XXX)'

" Add a shortcut for grepping the current word
nnoremap <leader>* :Grepper -noprompt -query -w <c-r><c-w><cr>

" Add a shortcut for grepping the current word
nnoremap <leader>s :Grepper -noprompt -query -w<space>

" map shortcut for make
nnoremap <leader>m :update<bar>make<cr>

" quit buffer(window)
nnoremap <leader>q :bp<bar>bd#<cr>

" use the very magic regex mode by remapping technique
nnoremap / /\v

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Disable matchup's statusline
let g:matchup_matchparen_offscreen = {}

" Vim Airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0

" vim-gitgutter
set updatetime=250

" fugitive
set diffopt+=vertical

" tagbar
nnoremap <silent> <leader><space> :TagbarToggle<cr>

" tmux
let g:tmux_navigator_no_mappings = 1

nnoremap gh :SidewaysLeft<cr>
nnoremap gl :SidewaysRight<cr>

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" vimux
let g:VimuxHeight = "30"
nnoremap <silent> <leader>r :VimuxPromptCommand<cr>
nnoremap <silent> <leader>rr :VimuxRunLastCommand<cr>

" ALE
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\   'perl': ['perl'],
\   'asm': [],
\   'c': ['cppcheck', 'clangcheck'],
\   'cpp': ['cppcheck', 'clangcheck'],
\}

" YCM shortcuts
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>rn :YcmCompleter RefactorRename<space>
nnoremap <leader>gf :YcmCompleter Format<CR>

" YCM stuff
let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_hover=''
let g:ycm_clangd_args = ['-log=verbose', '-pretty']

" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
" let g:ycm_clangd_binary_path = 'clangd'
" let g:ycm_clangd_uses_ycmd_caching = 0

" Disable YCM
" let g:loaded_youcompleteme = 1

" FZF
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>l :BLines<cr>
nnoremap <silent> <leader>L :Lines<cr>
nnoremap <silent> <leader>] :Tags<cr>
nnoremap <silent> <leader>c :BCommits<cr>
nnoremap <silent> <leader>C :Commits<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>a :Rg<space>

" Preview window on the right side of the window,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['right:hidden', 'ctrl-/']

" Vimwiki
nmap <F13> <Plug>VimwikiNextLink
nmap <F14> <Plug>VimwikiPrevLink

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
  endif
  set showmode
  set showcmd
  set scrolloff=1
  Limelight!
  " Fix grayout highlighting
  highlight link PreprocessorGrayout Comment
endfunction

nnoremap yoy :Goyo<cr>

" Break habit of using arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" (Hopefully) removes the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Fix weird characters showing up in vim
let &t_TI = ""
let &t_TE = ""

command! NewMasm :r ~/master_2020/pla/asm_tools/npp/Plugins/Config/asm_template.asm

call textobj#user#plugin('cfunctioncall', {
\   'function': {
\     'pattern': '\v[a-zA-Z0-9_]+(::)?[a-zA-Z0-9_]+',
\     'select': ['af', 'if'],
\   }
\ })
