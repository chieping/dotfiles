# Chieping's Dotfiles

## Supported OS

- macOS
- Ubuntu

# Setup

TODO: one-liner install script

TODO: Use stow or make or something instead of scripts using ln command

## Base16

https://github.com/chriskempson/base16

## Tmux

install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

and then, hit `prefix + I` (I as in Install) to fetch the plugin

## ruby-build

Build dependency packages

https://github.com/sstephenson/ruby-build/wiki

# Further Settings

## Google Chrome

### (Windows) Chrome52以降でMacTypeを有効にする

- [【配布】MacTypeでDirectWriteの設定を変えるパッチ - しらいとブログ](http://silight.hatenablog.jp/entry/MacTypePatch)
- [Chrome で MacType を効かせる MacTypePatch がすごい　のこと](http://uwagakisimasuka.blog.fc2.com/blog-entry-4781.html)

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

### Use 1password (via Wine)

[Ubuntuで1Passwordを使ってみる - Ry0 Note](http://ry0.github.io/blog/2015/04/12/ubuntu-1password/)

### Disable HUD Search Menu

http://askubuntu.com/a/133777

System Settings --> Keyboard --> Short-cuts

Select "Key to show the HUD" and press Backspace to disable

### Install Golang up-to-date version

https://github.com/golang/go/wiki/Ubuntu

### Installing fonts

http://askubuntu.com/questions/3697/how-do-i-install-fonts

### Changing gnome terminal font

```
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ricty Bold 12"
```
