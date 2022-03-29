# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family-name        | string | null: false |
| first-name         | string | null: false |
| family-name-kana   | string | null: false |
| first-name-kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :goods
- has_one  :purchase

## goods テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| exhibitor        | string     | null: false                    |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| charge_id        | integer    | null: false                    |
| region_id        | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |

| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one  :purchase

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| good        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :good
- has_one    :shipper

## shippers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| region_id     | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phonenumber   | string     | null: false                    |

| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase