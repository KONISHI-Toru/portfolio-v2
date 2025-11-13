# ポートフォリオ管理システム

エンジニアのポートフォリオを表示するためのシステムです。
Rails の勉強がてら作ってみただけで、
特に誰かの役に立つようなものではありませんが、
使いたい人は自由にどうぞ。


## Requirement

- Ruby 3.4.1
- Rails 8.0
- MySQL

## Install

1. ソースの取得
```
git clone https://github.com/KONISHI-Toru/portfolio-v2.git
```

2. .env ファイルの作成
以下の環境変数を設定してください。
```
SENDER_ADDRESS=xxx@exaple.com
SERVER_NAME=example.local
```

3. 秘匿情報の設定
`EDITOR=vi rails credentials:edit --environment production` で
config/credentials/production.key、config/credentials/production.yml.enc を作成し、
以下の値を設定して下さい。

```
secret_key_base: xxxxxxx

db:
  username: username
  password: password

smtp:
  username: xxx@example.com
  password: password

seed:
  admin_email: xxx0@example.com
  admin_password: password
```

4. config/ 以下のファイルの内容を確認し、必要に応じて設定を変更して下さい。

## Licence

[MIT License](https://opensource.org/licenses/MIT).

## Author

[KONISHI Toru](mailto:sting@nifty.com)


