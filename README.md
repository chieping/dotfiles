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

# Further Settings

## Ubuntu

### Keyrepeat Interval and Delay

```
sudo gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat-interval 10
sudo gsettings set org.gnome.settings-daemon.peripherals.keyboard delay 180
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
