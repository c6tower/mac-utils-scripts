-- 引数に "きょう" を受け取ると "今日の日付" を、 "あす" を受け取ると "明日の日付" を返す関数を定義する
on get_date(yomi)
    set lang to "LANG=ja_JP.UTF-8"
    -- mm/dd(曜日) の形式で日付を取得する
    set dateFormat to "'+%m/%d(%a)'"
    if yomi = "おととい" then
        return (do shell script lang & " date -v-2d " & dateFormat)
    else if yomi = "きのう" then
        return (do shell script lang & " date -v-1d " & dateFormat)
    else if yomi = "きょう" then
        return (do shell script lang & " date " & dateFormat)
    else if yomi = "あす" then
        return (do shell script lang & " date -v+1d " & dateFormat)
    else if yomi = "あさって" then
        return (do shell script lang & " date -v+2d " & dateFormat)
    end if
end get_date

tell application "System Events"
    -- TODO: 遅延時間は環境によって調整する
    set longDelay to 0.5
    set shortDelay to 0.1

    -- スリープから復帰して2以内にパスワード入力完了している前提の処理のため
    -- TODO: "パスワード入力完了済み＝デスクトップ画面に遷移できる状態であること" を何かしらの方法で検知する
    delay 2

    -- デスクトップ画面に遷移する
    key code 103
    delay longDelay

    -- カーソル位置を初期化するためにユーザ辞書を閉じている状態から始める
    tell application "DictionaryTool" to quit
    delay longDelay

    -- ユーザ辞書を開く
    tell application "DictionaryTool" to activate
    delay longDelay

    -- "u" から始まる名前のユーザ辞書を選択する
    -- TODO: 辞書名を変更する場合はこちらの値も変更する
    keystroke "u"

    -- 単語を編集できる位置にカーソル移動する
    keystroke tab & tab
    keystroke return

    set targetDates to {"おととい", "きのう", "きょう", "あす", "あさって"}
    repeat with targetDate in targetDates
        -- クリップボードへの日付コピーは遅延が必要
        delay shortDelay
        set the clipboard to contents of targetDate
        keystroke "v" using {command down}
        delay shortDelay
        set the clipboard to my get_date(contents of targetDate)
        keystroke tab
        keystroke "v" using {command down}
        repeat 3 times
            keystroke tab
        end repeat
    end repeat

    -- TODO: ユーザ辞書を閉じる設定はデフォルト無効なので、必要に応じて有効にする
    -- delay shortDelay
    -- tell application "DictionaryTool" to quit
end tell
