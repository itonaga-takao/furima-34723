# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | text                | null: false             |
| email              | string              | foreign_key: true       |
| encrypted_password | string              | null: false             |
| real_first_name    | text                | null: false             |
| real_last_name     | text                | null: false             |
| kana_first_name    | text                | null: false             |
| kana_last_name     | text                | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :purchases

## items table

| Column           | Type       | Options           |
|-------------     |------------|-------------------|
| product_name     | string     | null: false       |
| product_details  | text       | null: false       |
| category         | string     | null: false       |
| product_status   | text       | null: false       |
| delivery_charge  | text       | null: false       |
| prefecture       | text       | null: false       |
| price            | integer    | null: false       |
| purchase         | references | foreign_key: true |
| user             | references | foreign_key: true |
| comment          | text       | null: true       |


### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column           | Type       | Options           |
|-------------     |------------|-------------------|
| postal_code      | string     | null: false       |
| prefecture       | string     | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building         | string     | null: true        |
| phone_number     | text       | null: false       |
| item             | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## buyers table

| Column           | Type       | Options           |
|-------------     |------------|-------------------|
| buyer_id         | string     | null: false       |
| bought           | string     | null: false       |
| purchase         | references | foreign_key: true |
| items            | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase