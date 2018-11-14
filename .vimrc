set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'ajh17/spacegray.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'

call vundle#end()

syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" colorscheme spacegray

filetype plugin indent on

set fileformats=unix,dos,mac
set nu
set relativenumber
set nowrap
set hlsearch
set ruler
set backspace=indent,eol,start
set scrolloff=999

set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

augroup twospaces
	autocmd!
	autocmd FileType javascript,json,html setlocal expandtab ts=2 sts=2 sw=2
augroup END

augroup fourspaces
	autocmd!
	autocmd FileType java,php,python setlocal expandtab ts=4 sts=4 sw=4
augroup END

" Open NERDTree with vim and close when :quit
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Move cursor to main window (not NERDTree)
autocmd VimEnter * wincmd p

nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :NERDTreeFind<CR>
nmap <F7> :Gblame<CR>
nmap <F8> :TagbarToggle<CR>

" Insert mode Red Numbers / Normal mode Yellow Numbers 
highlight LineNr ctermfg=3 ctermbg=16
function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		highlight LineNr ctermfg=1 ctermbg=16
	endif
endfunction

function! InsertLeaveActions()
	highlight LineNr ctermfg=3 ctermbg=16
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

set statusline=[%n]\ %t
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=%l:%c

" Check PSR-2 on php files and show errors at the bottom
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_exec = '~/.composer/vendor/bin/phpcs'
let g:syntastic_php_phpcs_args='--standard=PSR12 -n'
let g:syntastic_php_phpmd_exec = '~/.composer/vendor/bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

" 80 column highlight
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,120),",")
let &colorcolumn="80,".join(range(400,999),",")
 
highlight OverLength ctermbg=160 ctermfg=white guibg=NONE
match OverLength /\%120v.\+/

let NERDTreeShowHidden=1
let NERDTreeWinSize=50

hi Normal guibg=NONE ctermbg=NONE
