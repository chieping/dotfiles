#!/usr/bin/env fish
#
# このスクリプトは chezmoi の run_onchange_ スクリプトです。
# 「run_onchange_」プレフィックスにより、スクリプトの内容が変更されたときだけ実行されます。
# （chezmoi がスクリプトのハッシュ値を ~/.local/share/chezmoi/.chezmoistate.boltdb に記録して管理）
# プラグインを追加・削除・変更したときは `chezmoi apply` を実行すると再度このスクリプトが動きます。

# fisher がインストールされていなければインストールする
if ! type -q fisher
  echo 'install fisher'
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

# 各プラグインがまだインストールされていなければインストールする
# （すでにインストール済みの場合は fisher list がヒットするのでスキップ）
fisher list jethrokuan/z || fisher install jethrokuan/z                    # ディレクトリ履歴ジャンプ (z コマンド)
fisher list ilancosman/tide@v5 || fisher install ilancosman/tide@v5        # プロンプトテーマ Tide
fisher list jorgebucaran/replay.fish || fisher install jorgebucaran/replay.fish  # bash/zsh スクリプトを fish で実行
fisher list franciscolourenco/done || fisher install franciscolourenco/done      # 長時間コマンド完了通知

