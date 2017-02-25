"" used https://github.com/spf13/spf13-vim/blob/3.0/.vimrc for reference
set nocompatible
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

" line numbers
set number
syntax on
"	set mouse=a 	"enable mouse usage
set mousehide

set virtualedit=onemore
set showmode
set cursorline

let g:netrw_browse_split=4      " Open file in previous buffer

" swap between buffers
map <C-k><C-o> <c-w>w
" show buffers
nnoremap <leader>b :buffers<CR>:b<Space>
" shwo buffers split screen 
nnoremap <leader>v :buffers<CR>:vsp <bar> :b<Space>

" remap to beginning of line
nnoremap <C-a> 0
inoremap <C-e> <Esc>A
" remap to end of line
nnoremap <C-e> $
inoremap <C-a> <Esc>I
map <leader>t :echo 'Current time is ' . strftime('%c')<CR>

set pastetoggle=<leader>p

if has('cmdline_info')
	set ruler                   " Show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd                 " Show partial commands in status line and
								" Selected characters/lines in visual mode
endif

if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\                     " Filename
	set statusline+=%w%h%m%r                 " Options
	set statusline+=\ [%{&ff}/%Y]            " Filetype
	set statusline+=\ [%{getcwd()}]          " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
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
set foldenable                  " Auto fold code

" open nerd tree
map <leader>n :NERDTree<CR>

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

