# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :goods
- has_one  :purchase

## goods テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| exhibitor   | string     | null: false       |
| name        | text       | null: false       |
| explanation | string     | null: false       |
| status      | string     | null: false       |
| charge      | string     | null: false       |
| region      | string     | null: false       |
| date        | string     | null: false       |
| price       | integer    | null: false       |

| user        | references | foreign_key: true |

### Association

- belongs_to :user
- has_one  :purchase

## purchases テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| good        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :good
- has_one    :shipper

## shippers テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| postcode    | string     | null: false       |
| prefecture  | string     | null: false       |
| city        | string     | null: false       |
| address     | string     | null: false       |
| building    | string     |                   |
| phonenumber | string     | null: false       |

| user        | references | foreign_key: true |
| good        | references | foreign_key: true |

### Association

- belongs_to :purchase