# Chieping's Dotfiles

## Supported OS

- macOS
- Ubuntu

# Setup

TODO: Use stow or make or something instead of scripts using ln command

## Base16

https://github.com/chriskempson/base16

## Tmux

install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

and then, hit `prefix + I` (I as in Install) to fetch the plugin

## ruby-build

Build dependency packages

https://github.com/sstephenson/ruby-build/wiki

## Turn off acceleration on a Mac mouse

```bash
defaults write .GlobalPreferences com.apple.mouse.scaling -1
```

# Further Settings

## MacのJIS配列キーボードをUS配列に

[kenie 33 - JANSI: JANSI : Mac OS X 10.4 - 10.12](http://kenie33-jansi.blogspot.jp/p/mac-os-x-104-107-jisascii.html)

## Enable SSH Agent on Mac

~/.ssh/config

```sshconfig
Host *
  AddKeysToAgent yes
  UseKeychain yes
```

## Ubuntu

### Import CopyQ Configuration

```
copyq importData copyq.cpq
```

### Building Vim

[vim-jp » Linuxでのビルド方法](http://vim-jp.org/docs/build_linux.html)

### Keyrepeat Interval and Delay

```
gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat-interval 10
gsettings set org.gnome.settings-daemon.peripherals.keyboard delay 150
```

### Customize Window Management Key Binds

```
sudo apt-get install compizconfig-settings-manager
```

### Disable IME by Esc Key

Import `google-ime-mosc-keymap/keymap.txt`

### Clipboard Manager

```
sudo apt-get install clipit
```

### Disable HUD Search Menu

http://askubuntu.com/a/133777

System Settings --> Keyboard --> Short-cuts

Select "Key to show the HUD" and press Backspace to disable

### Installing fonts

http://askubuntu.com/questions/3697/how-do-i-install-fonts

### Changing gnome terminal font

```
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ricty Bold 12"
```
