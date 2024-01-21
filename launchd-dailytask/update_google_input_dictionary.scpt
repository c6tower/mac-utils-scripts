tell application "System Events"
    -- ユーザ辞書を開く
    tell application "DictionaryTool" to activate
    delay 0.1

    -- ユーザ辞書 "updated_daily" を選択
    keystroke "u"

    -- "よみ: きょう" を登録する
    set the clipboard to "きょう"
    keystroke tab & tab
    keystroke return
    keystroke "v" using {command down}
    delay 0.1
    set the clipboard to (do shell script "LANG=ja_JP.UTF-8 date '+%m/%d(%a)'")
    keystroke tab
    keystroke "v" using {command down}

    -- "よみ: あした" を登録する
    delay 0.1
    repeat 3 times
        keystroke tab
    end repeat
    set the clipboard to "あした"
    keystroke "v" using {command down}
    delay 0.1
    set the clipboard to (do shell script "LANG=ja_JP.UTF-8 date -v+1d '+%m/%d(%a)'")
    keystroke tab
    keystroke "v" using {command down}

    -- アプリを閉じる
    -- tell application "DictionaryTool" to quit
end tell
