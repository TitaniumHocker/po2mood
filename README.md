# po2mood

A warm, low-contrast sepia light theme for Neovim, tmux and kitty.

Named after the PO-2 concrete fence panel: a light, slightly warm gray
canvas with muted, earthy accents.

Forked from [nightsense/rusticated](https://github.com/nightsense/rusticated),
which is no longer maintained.

## Palette

The palette lives in [`lua/po2mood/palette.lua`](lua/po2mood/palette.lua).
The tmux and kitty files copy the same values.

Colors are defined in CIE LCh. Grays share one warm hue; the six accents share
one lightness and chroma and are spaced 60° apart in hue. Every color is tuned
to a round [WCAG contrast ratio](https://www.w3.org/TR/WCAG21/#contrast-minimum)
against the background, so all text clears the 4.5:1 AA threshold.

| Name        | Hex       | Contrast | Used for                                |
|-------------|-----------|----------|-----------------------------------------|
| `bg`        | `#dedcd8` | —        | background                              |
| `bg_alt`    | `#cccac4` | 1.2:1    | cursorline, popups, inactive bars       |
| `search`    | `#c7b46e` | 1.5:1    | search highlight                        |
| `border`    | `#a19c90` | 2:1      | separators, matching parens             |
| `comment`   | `#595446` | 5.5:1    | comments, line numbers, ANSI bright black |
| `fg`        | `#444136` | 7.5:1    | normal text                             |
| `fg_strong` | `#312d23` | 10:1     | cursor, ANSI bright white               |
| `red`       | `#834742` | 5.2:1    | identifiers, functions, errors          |
| `gold`      | `#645826` | 5.2:1    | specials, delimiters                    |
| `green`     | `#2c633f` | 5.2:1    | statements, keywords                    |
| `cyan`      | `#006470` | 5:1      | preprocessor, todos                     |
| `blue`      | `#3c5a89` | 5.1:1    | constants, strings, selection           |
| `magenta`   | `#784872` | 5.2:1    | types, warnings                         |

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

### Shaders

kitty 0.49+ can run [custom shaders](https://sw.kovidgoyal.net/kitty/custom-shaders/).
po2mood ships two:

- `po2mood-fence` — a subtle PO-2 pyramid relief behind the text. Only the
  default background is touched, and text stays above 4.5:1 contrast.
  Tune `CELL_SIZE` and `RELIEF` with `var` lines in the pipeline file.
- `po2mood-cursor` — kitty's built-in `cursor-trail-blaze` in palette colors.
  Needs `cursor_trail 1` or higher.

```sh
for f in po2mood-fence.pipeline po2mood-fence.slang po2mood-cursor.pipeline; do
  curl -fLo ~/.config/kitty/shaders/$f --create-dirs \
    https://raw.githubusercontent.com/TitaniumHocker/po2mood/master/extras/kitty/shaders/$f
done
```

Then in `kitty.conf` (use either one or both):

```conf
custom_shaders po2mood-fence po2mood-cursor
```

## License

[MIT](LICENSE). Original theme by nightsense.
