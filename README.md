# nvim true-color scheme and editor for C/C++ coders.

True color requires both [neovim](https://neovim.io/) as well as a true color terminal.
I am using konsole as terminal (`sudo apt install konsole`).
Google for others if you don't like konsole, there are [a few](http://homeonrails.com/2016/05/truecolor-in-gnome-terminal-tmux-and-neovim/).

Furthermore you need to change your `.vimrc` file; see
[dot\_vim/README.vimrc](dot_vim/README.vimrc) for details.

All of this assumes that your neovim will look in the old
vim directories for configuration; in order for it to do
that you als need to add a file `~/.config/nvim/init.vim`
with the following content:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

Next, install the files found in the `dot_vim` directory
into your ~/.vim directory (please also read the file
[dot\_vim/after/syntax/cpp/README.tags.vim](dot_vim/after/syntax/cpp/README.tags.vim) this tree).

The new color sheme should now work.

If you want to change a color, edit `cwcolors.vim`. A handy
way to find out what is a good color for you is to compile
the colorpicker tool included in the project and use that
that to see real-time in your own .cpp file what different
colors look like. Please read [ColorPicker/README](ColorPicker/README) for
details.

Finally, it is possible to also highlight your projects
type, classes, functions, variables etc; provided you
use `ctags`. Run `gentags` on your tags file to generate
the highlighting info for your project (normally you
have to do that every time you regenerate your tags file).
Please read [gentags/README](gentags/README) for further details.

<img src="/screenshot.png" alt="An example screenshot"/>
