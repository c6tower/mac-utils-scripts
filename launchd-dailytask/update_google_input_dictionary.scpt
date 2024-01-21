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
    -- ユーザ辞書を開く
    tell application "DictionaryTool" to activate
    delay 0.1

    -- ユーザ辞書 "updated_daily" を選択する
    keystroke "u"

    -- 単語を編集できる位置にカーソル移動する
    keystroke tab & tab
    keystroke return

    set targetDates to {"おととい", "きのう", "きょう", "あす", "あさって"}
    repeat with targetDate in targetDates
        -- クリップボードへの日付コピーは遅延が必要
        delay 0.01
        set the clipboard to contents of targetDate
        keystroke "v" using {command down}
        delay 0.01
        set the clipboard to my get_date(contents of targetDate)
        keystroke tab
        keystroke "v" using {command down}
        repeat 3 times
            keystroke tab
        end repeat
    end repeat

    -- ユーザ辞書を閉じる
    tell application "DictionaryTool" to quit
end tell
