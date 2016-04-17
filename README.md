# dotfiles

`stow`ed with love into `$HOME/.dotfiles` :D

## setup

```
git clone https://github.com/chrzrdx/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

To stow `termite`, for instance, do a simple :

```
stow termite
```

In case a `termite` config already exists at `~/.config/termite/config`, either
move the existing config elsewhere, else perform a `stow --adopt` followed by
cheking out the previous version of the file from within the local git repo.
(warning : this will override your previous existing configuration, therefore
take a backup of your existing configs first or commit the newly adopted config
before doing a git checkout/reset)

```
stow --adopt termite
git checkout -- termite
stow --restow termite
```

## software

### wm

`i3` with `i3status` (bar), `i3lock` (lock)

### programs (archlinux official repos)

- `termite` : term
- `neovim` : editor
- `zsh` : shell
- `mpd` + `ncmpcpp` : music
- `mpv` : media player
- `irssi` : IRC
- `scrot` : screenshotting
- `dunst` : notifications
- `compton` : compositing manager
- `stow` : to manage my dotfiles

### colorscheme

- `gruvbox` : for i3, termite, neovim
- `sanctuary`: for ncmpcpp

### fonts

- `tamsyn` : (monospace) termite, i3
- `Cantarell` : (sans) gtk

### themes

- `Clearlooks` (gtk2)
- `Adwaita` (gtk3)
- `Clearlooks` (qt)
- `gnome-icon-theme` (icon theme)

