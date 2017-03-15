"" used https://github.com/spf13/spf13-vim/blob/3.0/.vimrc for reference
set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
" Autocomplete plugin
Plugin 'Valloric/YouCompleteMe'

" Airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Disable YouCompleteMe
"let g:loaded_youcompleteme=1

set backspace=2

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
"set expandtab
set autoindent
set softtabstop=4               " Let backspace delete indent
set splitright                  " Puts new vsplit windows to the right of the current
set relativenumber

" move lines up and down
nnoremap <Esc>[1;3A :m .-2<CR>==
nnoremap <Esc>[1;3B :m .+1<CR>==
inoremap <Esc>[1;3A <Esc>:m .-2<CR>==gi
inoremap <Esc>[1;3B <Esc>:m .+1<CR>==gi
vnoremap <Esc>[1;3A :m '<-2<CR>gv
vnoremap <Esc>[1;3B :m '>+1<CR>gv

nnoremap <Esc>k :m .-2<CR>==
nnoremap <Esc>j :m .+1<CR>==
inoremap <Esc>k <Esc>:m .-2<CR>==gi
inoremap <Esc>j <Esc>:m .+1<CR>==gi
vnoremap <Esc>k :m '<-2<CR>gv
vnoremap <Esc>j :m '>+1<CR>gv

" tabbing in visual mode
vnoremap <Tab> ><CR>gv
vnoremap <S-Tab> <<CR>gv

" line numbers
set number
syntax on
"	set mouse=a 	"enable mouse usage
set mousehide

set virtualedit=onemore
set showmode
set cursorline

"let g:netrw_browse_split=4      " Open file in previous buffer

" swap to next buffer (hidden)
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprevious<CR>
" swap between buffers
map <C-k><C-o> <c-w>w
" show buffers
nnoremap <leader>b :buffers<CR>:b<Space>
" shwo buffers split screen 
nnoremap <leader>v :buffers<CR>:vsp <bar> :b<Space>

" remap to beginning of line
nnoremap <C-a> 0
vnoremap <C-a> 0
inoremap <C-e> <Esc>A
" remap to end of line
nnoremap <C-e> $
vnoremap <C-e> $
inoremap <C-a> <Esc>I
map <leader>t :echo 'Current time is ' . strftime('%c')<CR>
vnoremap <leader>y "+y<CR>

set pastetoggle=<leader>p

if has('cmdline_info')
	set ruler                   " Show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd                 " Show partial commands in status line and
								" Selected characters/lines in visual mode
endif

set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
"set nofoldenable                " Auto fold code
set foldenable                " Auto fold code
set foldmethod=indent
"set foldmethod=manual
"set foldlevelstart=1

" jj as escape character 
inoremap jj <ESC>	
" save state of vim on exit and load state on enter
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

"comment/uncomment
vnoremap <C-k><C-k> :norm<Space>

" open nerd tree
map <leader>n :NERDTreeToggle<CR>

" airline settings
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" NerdTree {
	if isdirectory(expand("~/.vim/plugin/nerdtree"))
		map <C-e> <plug>NERDTreeTabsToggle<CR>
		map <leader>e :NERDTreeFind<CR>
		nmap <leader>nt :NERDTreeFind<CR>

		let NERDTreeShowBookmarks=1
		let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
		let NERDTreeChDirMode=0
		let NERDTreeQuitOnOpen=1
		let NERDTreeMouseMode=2
		let NERDTreeShowHidden=1
		let NERDTreeKeepTreeInNewTab=1
		let g:nerdtree_tabs_open_on_gui_startup=0
	endif
" }


" status line color change and commands
"if has('statusline')
"	function! InsertStatuslineColor(mode)
"	  if a:mode == 'i'
"		hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
"	  elseif a:mode == 'r'
"		hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
"	  else
"		hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
"	  endif
"	endfunction
"
"	au InsertEnter * call InsertStatuslineColor(v:insertmode)
"	au InsertLeave * hi statusline guibg=DarkGrey ctermfg=4 guifg=White ctermbg=15
"
"	" default the statusline to green when entering Vim
"	hi statusline guibg=DarkGrey ctermfg=4 guifg=Black ctermbg=15
"
"	set laststatus=2
"
"	" Broken down into easily includeable segments
"	set statusline=%<%f\                     " Filename
"	set statusline+=%w%h%m%r                 " Options
"	set statusline+=\ [%{&ff}/%Y]            " Filetype
"	set statusline+=\ [%{getcwd()}]          " Current dir
"	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"
"	set statusline+=\ %=                        " align left
"	set statusline+=\ Buffer:%n                    " Buffer number
"endif

function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()


