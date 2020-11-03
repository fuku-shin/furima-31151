# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| readfirst_name     | string  | null: false |
| readlast_name      | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :sales


## items テーブル

| Column         | Type       | Options          |
| -------------- | ---------- | ---------------- |
| name           | string     | null: false      |
| explanation    | text       | null: false      |
| price          | integer    | null: false      |
| payment_id     | integer    | null: false      |
| status_id      | integer    | null: false      |
| area_id        | integer    | null: false      |
| days_id        | integer    | null: false      |
| category_id    | integer    | null: false      |
| user           | references | foreign_key:true |

### Association
- belongs_to :user
- has_one :sale
- has_many :comments


## comments テーブル

| Column   | Type       | Options          |
| -------- | ---------- | ---------------- |
| comment  | string     | null: false      | 
| item     | references | foreign_key:true |
| user     | references | foreign_key:true |


### Association
- belongs_to :items
- belongs_to :users


## sales テーブル

| Column         | Type       | Options          |
| -------------- | ---------- | ---------------- |
| user           | references | foreign_key:true | 
| item           | references | foreign_key:true |

### Association
- has_one :address
- belongs_to item
- belongs_to user


## address テーブル

| Column         | Type       | Options          |
| -------------- | ---------- | ---------------- |
| postal         | string     | null: false      |
| prefecture_id  | integer    | null: false      |
| municipality   | string     | null: false      |
| address        | string     | null: false      |
| building       | string     |                  |
| phone_number   | string     | null: false      |
| sale           | references | foreign_key:true |

### Association
- belongs_to :sale
