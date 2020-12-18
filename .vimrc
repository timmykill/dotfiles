" Impostazione tabs
set tabstop=4
set shiftwidth=4
set autoindent

" folding
set foldmethod=indent
set foldlevelstart=99
nnoremap <space> za
vnoremap <space> zf

" Roba grafica
syntax on
set relativenumber
set nohlsearch

" Backup file in /tmp
set nobackup

" Roba da gentoo, credo
set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
let g:tex_flavor='latex'

" gotta go fast
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>



" Ide mode
fun! IdeMode( arg ) "{{{
	packadd coc.nvim-release
	" Tab completion
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" :
			"\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction


	"File explorer stuff
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3
	let g:netrw_browse_split = 4
	let g:netrw_altv = 1
	let g:netrw_winsize = 15
	Vexplore
endfunction "}}}

command! -nargs=* IdeMode call IdeMode( '<args>' )
 
