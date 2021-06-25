# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false, unique: true|
| encrypted_password | string              | null: false             |
| real_first_name    | text                | null: false             |
| real_last_name     | text                | null: false             |
| kana_first_name    | text                | null: false             |
| kana_last_name     | text                | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :addresses

## items table

| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| name                | string     | null: false       |
| details             | text       | null: false       |
| category_id         | integer    | null: false       |
| status_id           | integer    | null: false       |
| delivery_charge_id  | integer    | null: false       |
| days_to_ship_id     | integer    | null: false       |
| prefecture_id       | integer    | null: false       |
| price_id            | integer    | null: false       |
| purchase            | references |                   |
| user                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :address

## addresses table

| Column           | Type       | Options           |
|-------------     |------------|-------------------|
| postal_code      | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| phone_number     | text       | null: false       |


### Association

- has_one :item

## buyers table

| Column           | Type       | Options           |
|-------------     |------------|-------------------|
| item             | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- has_many :items