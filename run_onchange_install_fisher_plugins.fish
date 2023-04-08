#!/usr/bin/env fish

if ! type -q fisher
  echo 'install fisher'
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

fisher list jethrokuan/z || fisher install jethrokuan/z
fisher list ilancosman/tide@v5 || fisher install ilancosman/tide@v5
fisher list jomik/fish-gruvbox || fisher install jomik/fish-gruvbox
