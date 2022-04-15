# アプリケーション概要
駆け出しの頃のポートフォリオです。お手柔らかにお願いします😂
- 使用言語
Ruby(on Rails)/JavaScript/SCSS
- 書評を記録するためのアプリケーション
![アプリケーショントップ画](app/assets/images/top.png)
- スマホ画面
![アプリケーショントップ画](app/assets/images/resoponsive.png)
- デモサイト(AWS EC2 & S3)
http://54.238.36.232/

# 機能概要
## ユーザー管理機能
- ログイン・新規登録機能
- ウィザード形式をお持ちいた登録機能
![ウィザード形式](app/assets/images/wizard.png)
- SNS認証 [Google & FaceBook]
SNS認証は開発環境のみ実装（ドメインの取得が必要なため）
![SNS認証](app/assets/images/sns.png)

## 書評投稿機能
- 新規投稿・編集・削除機能実装
- 画像投稿時はプレビューの表示
![プレビュー画像](app/assets/images/preview.png)

## 書評検索機能
- ransackを用いた検索機能の実装
![検索機能の実装](app/assets/images/search.png)
![検索機能の実装](app/assets/images/ransack.png)

## いいね機能
- 非同期通信でいいね機能の実装
![検索機能の実装](app/assets/images/iine.png)





