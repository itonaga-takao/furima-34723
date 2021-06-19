# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | text                | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| real-name          | text                | null: false             |
| kana-name          | text                | null: false             |
| birthday           | string              | null: false             |

### Association

* has_many :items
* has_many :purchase

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| items                               | string     | null: false       |
| category                            | text       | null: false       |
| price                               | string     | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase table

| Column           | Type       | Options           |
|-------------     |------------|-------------------|
| credit-number    | string     | null: false       |
| expiration-date  | string     | null: false       |
| security-code    | string     | null: false       |
| postal-code      | string     | null: false       |
| prefectures      | text       | null: false       |
| municipality     | text       | null: false       |
| address          | text       | null: false       |
| building         | text       | null: false       |
| phone-number     | text       | null: false       |
| items            | references | foreign_key: true |
| user             | references | foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user