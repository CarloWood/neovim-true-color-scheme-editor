" Add the following syntax highlighting related configuration to your ~/.vimrc file:

if has('nvim')
  set t_8f=^[[38;2;%lu;%lu;%lum
  set t_8b=^[[48;2;%lu;%lu;%lum
  set termguicolors
endif
colorscheme cwcolors
syntax enable

" Recommended, but optionally add:

" Highlight trailing spaces.
let c_space_errors=1
" Don't highlight the Next match while typing a regular expression search.
set noincsearch

" Obviously remove any conflicting lines.
