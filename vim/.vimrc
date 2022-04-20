"Make sure vim-plug is installed:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"than during the first"start of vim you can install the plugins with:
"		:PlugInstall
"For valloric/youcompleteme you will need to install
"dependencies and compile, by running 
"	~/.vim/plugged/youcompleteme/install.py --all
"Manual here: ~/.vim/plugged/youcompleteme/doc/youcompleteme.txt
"Syntastic manual here: ~/.vim/plugged/syntastic/doc
"For Tagbar you need to install ctags!
syntax on
:set laststatus=2
set backspace=indent,eol,start
colorscheme wombat256dave  
set relativenumber
set number
set encoding=utf-8
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
map <C-n> :NERDTreeToggle<CR>
map <C-%> :vsplit
map <C-"> :split
nnoremap <C-J> <C-W>j<C-J>
nnoremap <C-K> <C-W>k<C-K>
nnoremap <C-L> <C-W>l<C-L>
nnoremap <C-H> <C-W>h<C-H>
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirs<CR>
nnoremap tl :tablast<CR>
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 500  " default value
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

"Syntastics
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_ansible_checkers = ['ansible-lint']
let g:syntastic_json_checkers = ['jsonlint']  
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

"Install The NERD commenter
Plug 'scrooloose/nerdcommenter'

"Install the NERDtree
Plug 'scrooloose/nerdtree'

"Install Tagbar
Plug 'majutsushi/tagbar'

"Install vim-gitgutter
Plug 'airblade/vim-gitgutter'

"Install youcompleteme
Plug 'valloric/youcompleteme'

"Install Fugitive.vim
Plug 'tpope/vim-fugitive'

"Install Syntastic
Plug 'scrooloose/syntastic'

"Install surround.vim
Plug 'tpope/vim-surround'

"Install ctrlp
Plug 'kien/ctrlp.vim'

"Install vim-airline
Plug 'bling/vim-airline'

"Install vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

"Install emmet-vim
Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()


