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
- has_many :managements

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

 How to run the test suite
- belongs_to :user
- has_one :management

## managements テーブル

Deployment instructions
| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| item           | references | foreign_key: true |
| user           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buy

## buy テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| management      | references |             |
| area_number     | string     | null: false |
| area_id         | integer    | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building        | string     |             |
| phone_number    | string     | null: false |

### Association

- belongs_to :management