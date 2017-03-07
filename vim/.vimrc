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
colorscheme afterglow 
set number
set encoding=utf-8
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
map <C-n> :NERDTreeToggle<CR>
map <C-%> :vsplit
map <C-"> :split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 500  " default value

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

" Initialize plugin system
call plug#end()


