# README

# テーブル設計

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
| ------------- | ------ --- | ----------------- |
| title         | string     | null: false       |
| detail        | text       |                   |
| item          | text       |                   |
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

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| comment_text | string     | null: false       |
| nail         | references | foreign_key: true |
| user         | references | foreign_key: true |

### Association

belongs_to :nail
belongs_to :user