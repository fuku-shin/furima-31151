# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  | null: false |
| readname | string  | null: false |
| birthday | integer | null: false |
| 

### Association

- has_many :products
- has_many :comments

## products テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| image   |            |             |
| name    | string     | null: false |
| price   | integer    | null: false |
| payment | string     | null: false |
| user    | references |             |

### Association
- belongs_to :users
- has_many :comments


## comments テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| comment  | string     | null: false | 
| products | references |             |
| user     | references |             |


### Association
- belongs_to :products
- belongs_to :users
