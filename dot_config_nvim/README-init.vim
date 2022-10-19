" Add the following syntax highlighting related configuration to your ~/.config/nvim/init.vim file:
" The ^[ here is one character that you can type with control-v ESC.

if has('nvim')
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
endif
colorscheme cwcolors
syntax enable

" Recommended, but optionally add:

" Set tag file if REPOBASE is set. This assumes you set the environment
" variable REPOBASE to reflect the base directory of your current project
" and generated your ctags file as $REPOBASE-objdir/tags.
if $REPOBASE != ""
  set tags=$REPOBASE-objdir/tags
endif

" Bind <F10> to a function that shows the syntax highlighting group under the cursor.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
\       '> trans<' . synIDattr(synID(line("."),col("."),0),"name") .
\       "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Highlight trailing spaces.
let c_space_errors=1
" Don't highlight the Next match while typing a regular expression search.
set noincsearch

" Obviously remove any conflicting lines.
