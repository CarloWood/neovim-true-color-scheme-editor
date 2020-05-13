" Optionally, generate a tags.vim file somewhere. For example,
"
" $ gentags $REPOBASE-objdir/tags | sort -u > $REPOBASE-objdir/tags.vim
"
" where $REPOBASE-objdir/tags is the tags file that you just generated with
" ctags, for example:
"
" $ cd $REPOBASE-objdir && ctags --language-force=C++ --regex-C++='/(^|[[:space:];{])using[[:space:]]+([[:alnum:]_]*)[[:space:]]*=/\2/' `s`;
"
" which adds support for the 'using' keyword (if your ctags doesn't have that
" already of course). And where 's' is an alias that prints all source files
" involved. For example,
"
" $ alias s='ls $REPOBASE/{cwds,utils,threadsafe,statefultask,evio}/*.{cxx,h} $REPOBASE/src/*.cxx $REPOBASE/evio/libev-*/*.{c,h}'
"
" Of course this is project dependent. I urge you to start using
" http://carlowood.github.io/howto/cdeh.html#download
" for automatic environment (and commandline history) switching.
"
" This vim script then loads it.
if filereadable($REPOBASE . "-objdir/tags.vim")
  source $REPOBASE-objdir/tags.vim
endif
