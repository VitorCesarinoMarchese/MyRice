# MyRice

This is my rice backup for `.config`, `.local/share`, `packages` and `Pictures`.

## Backuping

**First** go to the directory:

```bash
cd MyRice
```

After that you can start the process.

**obs:** only backup things you changed, for example I updated the waybar config, so just cp the waybar, the commands bellow are just for a full backup adjust conform your needs.

1. Backup `.config`

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

2. Backup `.local`

```bash
rsync -r ~/.local/share/icons/ ~/.local/share/themes/ ./.local/share/
```

3. Backup Pictures

**obs:** Pictures are my wallpapers and imgs that are used in the system.

```bash
rsync -r ~/Pictures/ ./Pictures/
```

4. Backup Packages

Packages are the exception! You can run this every time you update your system

```bash
pacman -Qqe > ./packages/pkglist.txt
yay -Qqe > ./packages/aur_pkglist.txt
```

## Restoring / Installing the Backup

To install the rice on a new system (or restore after a reset), follow the steps below.

1. Clone the Backup

```bash
git clone https://github.com/yourusername/MyRice.git
cd MyRice
```

2. Reinstall Packages

Official packages:

```bash
sudo pacman -S --needed - < ./packages/pkglist.txt
```

AUR packages:

```bash
yay -S --needed - < ./packages/aur_pkglist.txt
```

3. Restore `.config`

```bash
rsync -r \
.config/hypr \
.config/waybar \
.config/kitty \
.config/fish \
.config/wofi \
.config/nvim \
.config/fastfetch \
.config/gtk-3.0 \
.config/gtk-4.0 \
.config/xsettingsd \
.config/qt5ct \
.config/qt6ct \
.config/fontconfig \
.config/swaync \
.config/mako \
.config/custom_scripts \
.config/pavucontrol.ini \
~/.config/
```

4. Restore `.local/share`

obs: you may need to download the [icons](https://www.gnome-look.org/p/1961046) again

```bash
rsync -r ./.local/share/icons/ ~/.local/share/icons/
rsync -r ./.local/share/themes/ ~/.local/share/themes/
gsettings set org.gnome.desktop.interface icon-theme 'Gruvbox-Plus-Dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Plus-Dark'
```

5. Restore Pictures (Wallpapers / System Images)

```bash
rsync -r ./ ~/Pictures/
```

6. Setup fish

```bash
chsh -s /usr/bin/fish
```

7. Reboot
