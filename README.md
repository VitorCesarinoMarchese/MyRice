# MyRice

This is my rice backup for `.config`, `.local/share`, `packages` and `Pictures`.

## Backuping

**First** go to the directory:

```bash
cd MyRice
```

After that you can start the process.

**obs:** only backup things you changed, for example I updated the waybar config, so just cp the waybar, the commands bellow are just for a full backup adjust conform your needs.

### .config

```bash
rsync -r \
~/.config/hypr \
~/.config/waybar \
~/.config/kitty \
~/.config/fish \
~/.config/wofi \
~/.config/nvim \
~/.config/fastfetch \
~/.config/gtk-3.0 \
~/.config/gtk-4.0 \
~/.config/xsettingsd \
~/.config/qt5ct \
~/.config/qt6ct \
~/.config/fontconfig \
~/.config/swaync \
~/.config/mako \
~/.config/custom_scripts \
~/.config/pavucontrol.ini \
.config/
```

### .local

```bash
cp -r ~/.local/share/icons/ ~/.local/share/themes/ ./.local/share/
```

### Pictures

**obs:** Pictures are my wallpapers and imgs that are used in the system.

```bash
cp -r ~/Pictures/ ./Pictures/
```

### Packages

Packages are the exception! You can run this every time you update your system

```bash
pacman -Qqe > ./packages/pkglist.txt
yay -Qqe > ./packages/aur_pkglist.txt
```
