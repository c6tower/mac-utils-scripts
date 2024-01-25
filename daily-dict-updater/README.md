# launchd-dailytask

PC起動時に実行される日次タスクをlaunchdで管理するためのリポジトリ

## 各ファイルの説明と初期設定

### local.dailytask.plist

起動時に実行されるplistファイル
使用前に以下の手順を実行する必要がある

1. TODOコメント部分の `/Users/hoge/launchd-dailytask/update_google_input_dictionary.scpt` を自分の環境に合わせて書き換える
2. 修正後のplistファイルを `~/Library/LaunchAgents/` に配置する
3. `launchctl load ~/Library/LaunchAgents/local.dailytask.plist` を実行する
    1. この時点で `~/Library/LaunchAgents/local.dailytask.plist` が実行される
    1. 以降は自動でPC起動するたびに実行される

### update_google_input_dictionary.scpt

Google日本語入力の辞書を更新するAppleScript
