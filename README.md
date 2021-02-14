# テーブル設計

## users テーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false, unique: true |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name-kana  | string  | null: false               |
| first_name-kana | string  | null: false               |
| birth_day       | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_info       | text       | null: false                    |
| item_category   | string     | null: false                    |
| item_status     | string     | null: false                    |
| item_fee_status | string     | null: false                    |
| item_prefecture | string     | null: false                    |
| item_delivery   | integer    | null: false                    |
| item_price      | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to : users
- has_one : order
- has_one : image

## images テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| name    | integer    | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to : items

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_number    | integer    | null: false                    |
| card_exp_month | integer    | null: false                    |
| card_exp_year  | integer    | null: false                    |
| card_cvc       | integer    | null: false                    |
| postal_code    | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
