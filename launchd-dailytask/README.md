# launchd-dailytask

PC起動時に実行される日次タスクをlaunchdで管理するためのリポジトリ

## local.dailytask.plist

起動時に実行されるplistファイル
使用前に以下の手順を実行する必要がある

1. TODOコメント部分の `/Users/hoge/launchd-dailytask/update_google_input_dictionary.scpt` を自分の環境に合わせて書き換える
2. 修正後のplistファイルを `~/Library/LaunchAgents/` に配置する

## update_google_input_dictionary.scpt

Google日本語入力の辞書を更新するAppleScript
