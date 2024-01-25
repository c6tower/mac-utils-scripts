# daily-dict-updater

「[Google日本語入力](https://www.google.co.jp/ime/)」の辞書を日次で更新するためのツール。

## 前提条件

- AppleScript が実行できる環境
    - macOS 12.7.1 (Monterey) で動作確認済み
- [Google日本語入力](https://www.google.co.jp/ime/) がインストールされていること
- [sleepwatcher](https://www.bernhard-baehr.de/) がインストールされていること
    - Homebrew でインストールする場合は `brew install sleepwatcher` でインストールできる

## 使い方

```sh
# `update_daily_dict.txt` ファイルをGoogle日本語入力の辞書にインポートする
# （Google日本語入力のUIを開き、「管理 > 新規辞書にインポート > ファイル: `update_daily_dict.txt`, 辞書名: `update_daily_dict`」で設定できる）

# `wakeup.shell` を必要に応じて編集した上で、 `~/.wakeup` にコピーする
$ cp wakeup.shell ~/.wakeup

# `~/.wakeup` を実行可能にする
$ chmod +x ~/.wakeup

# sleepwatcher を起動する
$ brew services start sleepwatcher
```

以上で設定完了。
以降、macOSのスリープから復帰するたびに、辞書の更新が行われる。

## 注意点

- 初回実行時のみ、各種アプリケーションへのアクセス許可を求められる可能性があるため適宜許可する。
    - この許可作業が発生した場合、処理が正常終了しない可能性ある
    - その場合は、再度スリープしてから復帰することで、正常に処理が行われる
- 辞書名は `u` から始まる必要があり、また他に `u` から始まる辞書が存在してはいけない
    - この仕様は `update_google_input_dictionary.scpt` のユーザ辞書選択処理を編集することで変更可能
