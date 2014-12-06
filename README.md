##Name
#my-cookpad

##Overview
Rails練習用、クックパッドのコピーアプリ

##Demo
[https://my-cookpad.herokuapp.com/](https://my-cookpad.herokuapp.com/)

##機能一覧
###1. 認証
* 会員登録
* ログイン
* SNSログイン(Facebook)
* ログアウト

###2. マイページ
* 登録情報の表示（メールアドレス、性別、生年月日、郵便番号）
* ニックネームの変更
* メール配信設定の表示／変更

###3. レシピの登録
* タイトル
* レシピのキャッチコピー
* 材料／分量
* 料理の写真
* 手順１の写真＋作り方．．手順４まで
* 手順の入れ替え
* 手順の追加／削除

###4. レシピの表示
* つくれぽの登録

###5. レシピの検索
* キーワードで検索のみ
* ページャー機能付き

##テーブル構成
###users（ユーザー）
* メールアドレス、パスワード、性別、生年月日、郵便番号、ニックネーム

###email_magazines（メールマガジンマスタ）
* タイトル

###subscriptions（購読メールマガジン）
* ユーザーID、メールマガジンマスタID、購読フラグ

###recipes（レシピ）
* タイトル、キャッチコピー、写真、公開状態

###ingredients（材料）
* 材料、分量

###directions（手順）
* 順番、写真、説明

###tukurepos（つくれぽ）
* 写真、メッセージ

##テーブル関連
* users (1) --- (多) recipes
* recipes (1) --- (多) ingredients
* recipes (1) --- (多) directions
* recipes (1) --- (多) tukurepos (多) --- (1) users
* users (1) --- (多) subscriptions (多) --- (1) email_magazines
