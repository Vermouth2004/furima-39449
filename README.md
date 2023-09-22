# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| birth_year          | integer | null: false |
| birth_month          | integer | null: false |
| birth_date          | integer | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| detail             | text   | null: false   |
| category            | string | null: false |
| condition           | string | null: false |
| shipping_charge     | string | null: false |
| shipping_address    | string | null: false |
| shipping_date       | string | null: false |
| price               | integer | null: false |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_one :address

## purchases テーブル

| Column  | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |
| address_id| references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code | integer | null: false                   |
| prefecture  | string | null: false |
| city        | string | null: false |
| street_address  | string | null: false |
| building       | string |              |
| phone_number   | integer | null: false |
| purchase_id| references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :item