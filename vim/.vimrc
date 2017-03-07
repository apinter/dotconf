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

