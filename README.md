# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| first_name     | string  | null: false |
| last_name      | string  | null: false |
| readfirst_name | string  | null: false |
| readlast_name  | string  | null: false |
| birthday       | date    | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| explanation | text       | null: false |
| price       | integer    | null: false |
| payment     | integer    | null: false |
| status      | integer    | null: false |
| area        | integer    | null: false |
| days        | integer    | null: false |
| category    | integer    | null: false |
| user        | references |             |

### Association
- belongs_to :users
- has_many :comments


## comments テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| comment  | string     | null: false | 
| items    | references |             |
| user     | references |             |


### Association
- belongs_to :items
- belongs_to :users


## sale テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| user_id        | references |             | 
| item_id        | references |             |
| card           | integer    | null: false |
| security_month | integer    | null: false |
| security_year  | integer    | null: false |
| postal         | integer    | null: false |
| prefectures    | integer    | null: false |
| municipality   | string     | null: false |
| address        | string     | null: false |
| building       | string     | null: false |
| phone_number   | integer    | null: false |


### Association

