# daily-dict-updater

「[Google日本語入力](https://www.google.co.jp/ime/)」の辞書を日次で更新するためのツール。

## 前提条件

- AppleScript が実行できる環境
    - macOS 12.7.1 (Monterey) で動作確認済み
- [Google日本語入力](https://www.google.co.jp/ime/) がインストールされていること
- [sleepwatcher](https://www.bernhard-baehr.de/) がインストールされていること
    - Homebrew でインストールする場合は `brew install sleepwatcher` でインストールできる

## 使い方

### 1. アプリケーションに必要なPC制御権限を付与する

Macのシステム環境設定を開き「セキュリティとプライバシー > プライバシー > アクセシビリティ」から下記アプリケーションにチェックを入れる

- sleepwatcher
- ターミナル.app（もしくは任意のターミナルアプリ）

### 2. `update_daily_dict.txt` ファイルをGoogle日本語入力の辞書ツールにインポートする

Google日本語入力の辞書ツールを開き、「管理 > 新規辞書にインポート > ファイル: `update_daily_dict.txt`, 辞書名: `update_daily_dict`」で設定する

> [!TIP]
> 「他に `u` から始まる名前の辞書が存在する場合」「任意の辞書名を設定したい場合」など、辞書名の変更が必要な場合は `update_google_input_dictionary.scpt` ファイルの修正も必要となる。

### 3. sleepwatcherの設定をする

```sh
# 必要に応じてスクリプトのTODO箇所を修正する
$ vi wakeup.shell
$ vi update_google_input_dictionary.scpt

# `~/.wakeup` に `sh wakeup.shell` を追記する
$ echo 'sh ~/daily-dict-updater/wakeup.shell' >> ~/.wakeup

# `~/.wakeup` を実行可能にする
$ chmod +x ~/.wakeup

# sleepwatcher を起動する
$ brew services start sleepwatcher
```

以上で初期設定完了。
以降、1日1回スリープから復帰するたびに辞書の更新が行われる。

> [!WARNING]
> 処理が正常終了しなかった場合＝辞書の更新が上手くいかなかった場合、 `last_exec_date.txt` ファイルを削除して再度スリープから復帰すると再実行される。
