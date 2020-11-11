## users テーブル

|       Column       |  Type   |   Options    |
|--------------------|---------|--------------|
| nickname           | string  | null: false  |
| encrypted_password | string  | null: false  |
| email              | string  | null: false  |
| first_name         | string  | null: false  |
| last_name          | string  | null: false  |
| first_yomigana     | string  | null: false  |
| last_yomigana      | string  | null: false  |
| birth_date         | date    | null: false  |

### Association
- has_many :items
- has_many :buy_records

## items テーブル

|      Column       |   Type     |       Options     |
|-------------------|------------|-------------------|
| name              | string     | null: false       |
| comment           | text       | null: false       |
| category_id       | integer    | null: false       |
| status_id         | integer    | null: false       |
| user              | references | foreign_key: true |
| delivery_fee_id   | integer    | null: false       |
| shipment_source_id| integer    | null: false       |
| shipping_day_id   | integer    | null: false       |

### Association
- belongs_to :user
- has_one :buy_record

## buy_records テーブル

|     Column      |   Type     |       Options     |
|-----------------|------------|-------------------|
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル
|     Column      |   Type     |       Options     |
|-----------------|------------|-------------------|
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| postal_cord     | string     | null: false       |
| buy_record      | references | foreign_key: true |

- belongs_to :buy_record