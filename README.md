# Nailrecipe

# アプリケーション概要
  ネイルデザインを投稿する「ネイル版レシピ投稿アプリ」を作成しました。
  デザインと合わせて施術方法（レシピ）を投稿することにより、デザインを公開したり、ユーザー同士がコメントを通じてコミュニケーションをとることを目的としています。
  
# URL
  未デプロイ

# テスト用アカウント
  ## ID/Pass
    ID: 未設定
    Pass: 未設定
  ## テスト用アカウント等
    ユーザー１（投稿者）
    メールアドレス:test@test.com
    パスワード: abc123
    ユーザー２（投稿者以外のユーザー）
    メールアドレス名: test2@test.com
    パスワード: abc123

# 利用方法
    ネイルデザインを投稿します。
    ネイルデザイン全体の画像と、それぞれの指でどのような施術をしたかを掲載します。
    他のユーザーが投稿したネイルデザインに対してコメントを投稿します。
    
# 目指した課題解決
    「セルフネイルが好きだけど、やり方やデザインを思いつかない」「誰かに自分が作ったデザインを見て欲しい」
    新型コロナウイルスの影響により、おうち時間が増えた中で、サロンに行かずセルフネイルを楽しむ人も多くなるのではないかと考えました。Webアプリケーションを通じてセルフネイルをもっと楽しくできないかと考思い、本アプリケーションを開発いたしました。
    ネイルという共通の趣味を通じて、ユーザー同士がコミュニケーションを取り合うことで、セルフネイルの新たな楽しみ方を提供したいと考えています。
# 洗い出した要件
  ## ユーザー登録・編集・マイページ機能
    ユーザーがアカウントにログインして機能を利用します。
    プロフィール情報を掲載することでつながる相手を選びやすくします。
    また、マイページにてそのユーザーがした投稿を一覧で見ることができます。
  [![Image from Gyazo](https://i.gyazo.com/320c88d3192d5b8270743338e49e62ae.gif)](https://gyazo.com/320c88d3192d5b8270743338e49e62ae)
  
  ## 新規投稿・編集・削除機能
    ネイルアートのデザイン・やり方（レシピ）を入力して投稿します。
  [![Image from Gyazo](https://i.gyazo.com/208d2489be9efca897cca93d4c10d55e.gif)](https://gyazo.com/208d2489be9efca897cca93d4c10d55e)
  ## 詳細表示・編集・削除機能
    クリックしたデザインを単一で表示します。一覧表示には表示されていなかった情報（レシピ・使用アイテム・コメント）を表示します。このページから投稿に対するコメントができます。
    自身がした投稿は編集・削除ボタンが表示され、編集・削除を行うことができます。
  [![Image from Gyazo](https://i.gyazo.com/69723fdc085803054da790106c42973d.gif)](https://gyazo.com/69723fdc085803054da790106c42973d)
  ## コメント投稿機能
    ネイルデザインに対してコメントを投稿することができます。
  [![Image from Gyazo](https://i.gyazo.com/ec2311159d3046d877c0bb43e1630fc4.gif)](https://gyazo.com/ec2311159d3046d877c0bb43e1630fc4)
  ## 検索機能
    投稿全体をキーワード検索できるようにします。
  [![Image from Gyazo](https://i.gyazo.com/fbad7388ca3a5d728a96ffcd212e28ca.gif)](https://gyazo.com/fbad7388ca3a5d728a96ffcd212e28ca)
  
# 実装予定の機能
  ## Try機能（いいね機能）
    実際にやってみたいと思った投稿に❤︎（いいね）をつけて反応できるようにします。
    コメントよりも気軽に好意を示す用途で実装したいと考えています。
  ## フォロー機能
    好みのデザイナーをフォローして自分のトップページに表示させます。
  ## ダグ付け機能
    タグをつけて投稿できるようにします。タグで検索をすることも可能にします。
  ## 画像プレビュー機能
    投稿する画像を確認するためにプレビュー表示をします。
  ## 複数枚画像投稿機能
    レシピの要所で画像を投稿できるようにします。
  ## 一時保存機能
    投稿内容を短時間で作成できない時のために、下書き状態で保存できるようにします。
  ## ショート動画投稿機能
    短い動画をレシピ内容を補足するものとして投稿できるようにします。
  ## SNS認証機能
    SNSアカウントを選択した場合に、すでにパスワードは入力されている状態で表示されるよう実装します。
    SNSアカウントは、Twitter、Facebook、Googleを想定しています。
  ## DM機能
    非同期通信を用いてリアルタイムでチャットができるようにします。
    チャット内容は当事者同士のみが閲覧することができます。

# データベース設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| profile            | text   |                           |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

has_many :nails
has_many :comments


## nails テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| title         | string     | null: false       |
| detail        | text       | null: false       |
| item          | text       | null: false       |
| thumb         | text       | null: false       |
| index_finger  | text       | null: false       |
| middle_finger | text       | null: false       |
| ring_finger   | text       | null: false       |
| little_finger | text       | null: false       |
| user          | references | foreign_key: true |

### Association

belongs_to :user
has_one :comments


## comments テーブル

| Column       | Type    | Options     |
| ------------ | --------| ----------- |
| text         | string  | null: false |
| nail         | integer |             |
| user         | integer |             |

### Association

belongs_to :nail
belongs_to :user


# ローカルでの動作方法
    WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
    ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
    接続先およびログイン情報については、上記の通りです。
    同時に複数の方がログインしている場合に、ログインできない可能性があります。
  ## ネイルデザインの投稿方法
    テストアカウントでログイン→トップページから「New Recipe」押下→ネイルデザイン入力→ネイルデザイン投稿
  ## コメント方法
    テストアカウントでログイン→トップページから投稿を選択→ページ下段の投稿フォームにコメントを入力→コメントを投稿
  ## 開発環境
    Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / Trello