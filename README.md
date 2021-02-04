# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| nickname  | string | null: false |
| name      | string | null: false |
| kana      | string | null: false |
| birthday  | date   | null: false |

### Association

- has_many :items

## items テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |
| price      | string     | null: false |
| category   | text       | null: false |
| state      | text       | null: false |
| shipping   | text       | null: false |
| area       | text       | null: false |
| day        | text       | null: false |
| user       | references |             |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item            | references |             |
| number          | integer    | null: false |
| expiration_date | date       | null: false |
| security_code   | date       | null: false |
| area_number     | integer    | null: false |
| prefectures     | text       | null: false |
| city            | text       | null: false |
| address         | text       | null: false |
| building        | text       |             |
| phone_number    | integer    | null: false |

### Association

- belongs_to :item