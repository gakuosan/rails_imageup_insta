概要
InstagramのCloneアプリケーションを作成する

Ruby on Railsにて開発。

HTML/CSS/Bootstrapを使用して、実際のInstagramを意識したデザインを適用。
画像の投稿・投稿確認・編集・一覧表示・削除機能を実装。
ログイン機能、ユーザ詳細画面、お気に入り一覧画面を実装。
ユーザテーブル <-1対多-> お気に入りテーブル <-多対1-> 画像テーブル により多対多を表現。
画像を投稿時にはユーザへに確認メールを送信。
いいね！機能をアソシエーションにより実装。
404/500のエラーページを用意。
バリデーションエラーは日本語化を実施。



環境、フレームワーク
Bootstrap v3
Ruby 2.3
Ruby on Rails 5.1.1
PostgreSQL
heroku
heroku add-ons SendGrid
heroku add-ons Heroku Postgres



使い方（ローカル環境）
git clone XXXXXX.git
cd InstagramClone/


rails db:migrate
rails s
工夫、こだわり

今後の課題、TODO
いいね！ボタンのUI改善（ページ遷移なし/非同期処理）
フォロー機能の実装
