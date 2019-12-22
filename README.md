# biophysics

生物物理学(今福先生)分のレポート課題。
講義内で行ったゲームを実装。また、条件を様々に変えることができることで、色々な変化を確認することができる

## ゲーム概要

6人グループで確率的にチップ(コイン)のやりとりをすることで、分子がエネルギーを交換し合う状況を追体験し、この場合エネルギー分布の変化をシュミレートする

## ゲーム手順

### defaultの場合

1. 6人グループを組み、各自に1~6の番号を割り振る。
2. 初期配分：サイコロを振り、出目の人が場のチップを1枚とる。これを30回繰り返す。
3. ランダムなやりとり
    + サイコロを振り、出目の人はチップを場に出す。持っていない場合には出さない。
    + また、サイコロをふり、出目の人は場のチップを取る
    + チップの枚数を毎回記録する
    + このやりとりを100回繰り返す

### 条件を変更する場合

下記の条件を変更することができます。

+ 参加人数
+ コインの枚数
+ 試行回数

## 実行方法

git clone もしくは zipファイルをDownload

### 実行環境

- ruby 2.6.1
- bundler 2.0.1

### rubyが使用PCにinstallされている場合

rubyのversionが `2.6.1` かどうか確認(2.6.1じゃなくても多分動くが、未検証)

```bash
$ ruby -v       #=> 2.6.1
$ ruby main.rb  # 実行
```

もし、rubyのversionが2.6.1じゃない場合には、出来るだけ合わせてください。rbenvなどを使用すれば、比較的簡単に導入できます。もしくは、 `rubyが使用PCにinstallされていない場合` の方法で実行してください
- 参考：https://dev.classmethod.jp/server-side/language/build-ruby-environment-by-rbenv/

### rubyが使用PCにinstallされていない場合

#### 1. Docker Desktop for (Mac/Windows/Linux)をinstall

https://www.docker.com/products/docker-desktop

- docker hubへの会員登録が必要。
- 参考
    + https://qiita.com/fkooo/items/d2fddef9091b906675ca
    + https://qiita.com/kurkuru/items/127fa99ef5b2f0288b81
    + https://docs.docker.com/docker-for-mac/

#### 2. docker containerを作成する

```bash
$ docker-compose build
```

#### 3. docker containerの中に入る

```bash
$ docker-compose run --rm biophysics bash
```

#### 4. 実行する

おそらくdocker containerの中に入っているので、そこで下記コマンドを実行

```bash
$ ruby main.rb
```

## Contributes

1. 本リポジトリをfork
2. branchをきる
2. 修正 or 実装
3. 本リポジトリへPullRequestを作成してください
