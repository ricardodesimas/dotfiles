set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'

call vundle#end()

syntax on

filetype plugin indent on

set fileformats=unix,dos,mac
set nu
set nowrap
set hlsearch
set ruler
set backspace=indent,eol,start

set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

augroup twospaces
    autocmd!
    autocmd FileType javascript,html setlocal expandtab ts=2 sts=2 sw=2
augroup END

augroup fourspaces
    autocmd!
    autocmd FileType java,php,python setlocal expandtab ts=4 sts=4 sw=4
augroup END

let g:jellybeans_use_gui_italics = 0
colorscheme jellybeans

autocmd vimenter * NERDTree
" autocmd vimenter * Tagbar 

autocmd VimEnter * wincmd p

nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :TagbarToggle<CR>

function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		highlight LineNr ctermfg=7 ctermbg=22
	endif
endfunction

function! InsertLeaveActions()
	highlight LineNr ctermfg=8 ctermbg=NONE
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")
