# nvim true-color scheme and editor for C/C++ coders.

True color requires both [neovim](https://neovim.io/) as well as a true color terminal.
I am using konsole as terminal (`sudo apt install konsole`).
Google for others if you don't like konsole, there are [a few](http://homeonrails.com/2016/05/truecolor-in-gnome-terminal-tmux-and-neovim/).

Furthermore you need to change `.config/nvim/init.vim` file (`.vimrc` if you added that to
your runtimepath); see [dot\_config\_nvim/README-init.vim](dot_config_nvim/README-init.vim) for details.

Next, install the files found in the `dot_config_nvim` directory
into your `~/.config/nvim` directory (please also read the file
[dot\_config\_nvim/after/syntax/cpp/README.tags.vim](dot_config_nvim/after/syntax/cpp/README.tags.vim) in this tree).

The new color scheme should now work.

If you want to change a color, edit `cwcolors.vim`. A handy
way to find out what is a good color for you is to compile
the colorpicker tool included in the project and use that
that to see real-time in your own .cpp file what different
colors look like. Please read [ColorPicker/README](ColorPicker/README) for
details.

Finally, it is possible to also highlight your projects
types, classes, functions, variables etc; provided you
use `ctags`. Run `gentags` on your tags file to generate
the highlighting info for your project (normally you'd
want to do that every time you regenerate your tags file).
Please read [gentags/README](gentags/README) for further details.

<img src="/screenshot.png" alt="An example screenshot"/>
