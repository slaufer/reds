# reds

Alternate bash prompt, dircolors, vim and alacritty themes that stay
readable under `redshift -P -O 1000 -b 0.7` (`$mod+F12`).

i3 colors are not in this repo: they live in `~/.config/i3/colors-*.Xresources`
and switch with the `$mod+F10/F11/F12` redshift keys.

At 1000K redshift passes roughly 100% red, 18% green and 0% blue (then ×0.7
brightness). Hue is effectively gone, so these themes put every color on a
ladder of **red-channel brightness** and use bold / italic / underline /
reverse to separate things that share a level. Blue is never relied on.

Even white on black only reaches about 3.1:1 contrast at this setting, so the
brightest tier is close to the ceiling. `tools/contrast.py` simulates the
shift and prints old vs new contrast for the key color pairs.

| file | what |
|---|---|
| `bash/bashrc.prompt.reds` | `~/.bashrc.prompt` with colors remapped (logic unchanged) |
| `bash/reds.sh` | `reds` switch command |
| `dircolors/dircolors.reds` | generated from `dircolors -p`; dirs bold, links italic, exec underlined |
| `vim/colors/vexing-reds.vim` | vexing on brightness tiers (tier table in the file header) |
| `alacritty/reds.toml` | 16-color palette spread across red levels |

## Install

```sh
# bash: add to ~/.bashrc after `source ~/.bashrc.prompt`
source ~/repos/reds/bash/reds.sh

# vim
ln -s ~/repos/reds/vim/colors/vexing-reds.vim ~/.vim/colors/
# and in ~/.vimrc, replace `color vexing` with:
#   if $REDS == '1' | color vexing-reds | else | color vexing | endif
```

## Use

```sh
reds on        # this shell: prompt + LS_COLORS + $REDS; this alacritty window's palette
reds off
reds           # toggle
reds status
```

Vim picks its scheme from `$REDS` when it starts, so a vim that's already open
needs `:color vexing-reds` instead. The alacritty change applies to the current
window only, through `alacritty msg config` (no config file edits). For every
window at once, add `general.import = ["~/repos/reds/alacritty/reds.toml"]`
to `alacritty.toml`.
