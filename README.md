# Chieping's Dotfiles

## Supported OS
- Mac OS X
- Ubuntu
- CentOS

# Setup
TODO one-liner install script

## Atom
install starred packages
```
$ apm stars --install
```

See: https://discuss.atom.io/t/installed-packages-list-into-single-file/12227/2

## Tmux
install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

and then, hit `prefix + I` (I as in Install) to fetch the plugin

## ruby-build

Build dependency packages

https://github.com/sstephenson/ruby-build/wiki

# Further Settings

## Ubuntu

## Building Vim
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

### IME Disable by Esc Key

Import `google-ime-mosc-keymap/keymap.txt`

### Clipboard Manager

```
sudo apt-get install clipit
```

### Use 1password (via Wine)

[Ubuntuで1Passwordを使ってみる - Ry0 Note](http://ry0.github.io/blog/2015/04/12/ubuntu-1password/)

### Solarized Colorscheme for Gnome Terminal

https://github.com/Anthony25/gnome-terminal-colors-solarized

### Disable HUD Search Menu

http://askubuntu.com/a/133777

System Settings --> Keyboard --> Short-cuts

Select "Key to show the HUD" and press Backspace to disable

### Install Golang up-to-date version

https://github.com/golang/go/wiki/Ubuntu
