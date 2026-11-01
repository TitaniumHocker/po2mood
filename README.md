# po2mood

A warm, low-contrast sepia light theme for Neovim, tmux and kitty.

Forked from [nightsense/rusticated](https://github.com/nightsense/rusticated),
which is no longer maintained. The palette is inherited unchanged; everything
around it has been rewritten for modern tools.

## Palette

The palette lives in [`lua/po2mood/palette.lua`](lua/po2mood/palette.lua).
The tmux and kitty files copy the same values.

| Name        | Hex       | Used for                          |
|-------------|-----------|-----------------------------------|
| `bg`        | `#d3d2ce` | background                        |
| `bg_alt`    | `#c3c0ba` | cursorline, popups, inactive bars |
| `border`    | `#989387` | separators, matching parens       |
| `comment`   | `#5f5a4c` | comments, line numbers            |
| `fg`        | `#444136` | normal text                       |
| `fg_strong` | `#312d23` | cursor, bright white              |
| `search`    | `#bca964` | search highlight                  |
| `red`       | `#834742` | identifiers, functions, errors    |
| `gold`      | `#645826` | specials, delimiters              |
| `green`     | `#2c633f` | statements, keywords              |
| `cyan`      | `#006470` | preprocessor, todos               |
| `blue`      | `#3c5a89` | constants, strings, selection     |
| `magenta`   | `#784872` | types, warnings                   |

## Neovim

Requires Neovim 0.12+ with `termguicolors` (on by default in most terminals).

With the built-in package manager:

```lua
vim.pack.add({ 'https://github.com/TitaniumHocker/po2mood' })
vim.cmd.colorscheme('po2mood')
```

The palette is available to your own config:

```lua
local p = require('po2mood.palette')
```

## tmux

With [TPM](https://github.com/tmux-plugins/tpm), add to `~/.tmux.conf`:

```tmux
set -g @plugin 'TitaniumHocker/po2mood'
```

Then press `prefix` + <kbd>I</kbd> to install.

The plugin only sets colors (status bar, windows, panes, messages, copy mode);
the contents of `status-left` and `status-right` are left to you.

## kitty

Download the theme into kitty's themes directory:

```sh
curl -fLo ~/.config/kitty/themes/po2mood.conf --create-dirs \
  https://raw.githubusercontent.com/TitaniumHocker/po2mood/master/extras/kitty/po2mood.conf
```

Then apply it with `kitten themes po2mood`, or add `include themes/po2mood.conf`
to `kitty.conf`.

## License

[MIT](LICENSE). Original theme by nightsense.
