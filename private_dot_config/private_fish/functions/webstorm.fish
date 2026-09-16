function webstorm --description "WebStorm でファイル/ディレクトリを開く（すぐプロンプトに戻る）"
    # MacOS/webstorm は IDE 本体のバイナリなので、そのまま実行すると
    # WebStorm が生きている間ずっとフォアグラウンドで居座る。
    # バックグラウンドに回して disown し、シェルを閉じても巻き添えにしない。
    command /Applications/WebStorm.app/Contents/MacOS/webstorm $argv >/dev/null 2>&1 &
    disown
end
