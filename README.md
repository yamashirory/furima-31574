# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| email      | string | null: false               |
| password   | string | null: false, unique: true |
| nickname   | string | null: false               |
| name_ue    | string | null: false               |
| name_shita | string | null: false               |
| kana_ue    | string | null: false               |
| kana_shita | string | null: false               |
| birthday   | date   | null: false               |

### Association

- has_many :items
- has_many :management

## items テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | string     | null: false       |
| description | text       | null: false       |
| price       | integer    | null: false       |
| category_id | integer    | null: false       |
| state_id    | integer    | null: false       |
| shipping_id | integer    | null: false       |
| area_id     | integer    | null: false       |
| day_id      | integer    | null: false       |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy
- has_one :management

## management テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| item           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buy テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item            | references |             |
| area_number     | integer    | null: false |
| prefectures     | text       | null: false |
| city            | text       | null: false |
| address         | text       | null: false |
| building        | text       |             |
| phone_number    | integer    | null: false |

### Association

- belongs_to :item