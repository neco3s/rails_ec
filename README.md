# README

課題用のrailsテンプレートです。

## 前提

- dockerが必要です。

## setup

```
docker compose build
```

```
docker compose run --rm web bin/setup
```


```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000

## 備考

- Taskのscaffoldが含まれていますが、CIの動作確認用です。
適宜削除いただければと思います。（そのままでも問題ないです）

## 🧪rspec

※デグレをふせぐために、rspecがすべて通ってからレビュー依頼を出してください。
※テストは欠陥があることは示せるが、欠陥がないことは示せないので、テストが通っているからといって安心しないでください。
[ソフトウェアテスト入門](https://speakerdeck.com/suwash/2022-08-30-software-testing?slide%253D43)

```
docker compose run --rm web bundle exec rspec
```

## 🤖rubocop

rubocopがすべて通ってからレビュー依頼を出してください。

auto correct

```
docker compose run --rm web bundle exec rubocop -A
```

## ✨htmlbeautifier

erbのフォーマッターです。
フォーマッターを通してからレビュー依頼を出してください。

```
docker compose run --rm web bin/htmlbeautifier
```

# reviewer追加してからレビュー依頼を出してください!!


## modelやrouteに注釈(コメント)をつける

schema情報をモデルにコメント

```
bundle exec annotate --models
```

~ルーティング情報をroutes.rbにコメント~ gem内部で使用されているrake routesがdeprecated(廃止された)だから代わりにrails routesを使って:poop:手動でroutes.rbにコピペする

```
bundle exec annotate --routes

rails routes --expanded | grep -E 'products|Route'

:poop: 手動でroutes.rbにコピペ
```
## db関連コマンド

データベースを削除し、新しいデータベースを作成し直してから、マイグレーションを実行します。その後、シードデータがあれば再度読み込まれます

```
rails db:reset
```

ActiveRecordを通して対話的にdbのrecordを確認する方法
```
rails c
irb(main) > Model.all
```

検証終了時にデータベースに関する変更をロールバックする方法

```
rails c -sandbox(s)
```
## 本番公開URL

<https://lit-ridge-54246-f28a7a68ae97.herokuapp.com/>
