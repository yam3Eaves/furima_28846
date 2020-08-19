# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## users table
|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  id  |  integer |     |
|  nickname  |  string  |  null: false   |
|  email  |  string  |   null: false, unique: true  |
|  password  |  string  |   null: false  |
|  last_name  |  string  |  null: false   |
|  first_name  |  string  |  null: false   |
|  last_name_kana  |  string  |  null: false   |
|  first_name_kana  |  string  |  null: false   |
|  birthday_year  |  integer  |  null: false   |
|  birthday_month  |  integer  |  null: false   |
|  birth_day  |  integer  |  null: false   |
|  created_at  |  timestamp  |  null: false   |
|  updated_at  |  timestamp  |  null: false   |

### Association

- has_many :items
- has_many :purchasers


## items
|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  id |  intger  |  |
|  img_url  |  string  |  null: false   |
|  name  |  string  |  null: false  |
|  explanation  |  text  |  null: false  |
|  category  |  string  |  null: false  |
|  condition  |  string  |  null: false  |
|  sipping_charge_bearer  |  string  |  null: false  |
|  shipping_area  |  string  |  null: false  |
|  days_untill_shipping  |  string  |  null: false  |
|  price  |  integer  |  null: false  |
|  created_at  |  timestamp  |  null: false  |
|  updated_at  |  timestamp  |  null: false  |
|  user_id  |  references  |  null: false, foreign_key: true  |


### Asociation
- belongs_to :user
- has_one :purchase



## purchasers
|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  id  |  integer  |    |
|  card_num  |  integer  |  null: false  |
|  expiration_date_month  |  integer  |  null: false  |
|  expiration_date_year  |  integer  |  null: false  |
|  security_code  |  integer  |  null: false  |
|  created_at  |  timestamp  |  null: false  |
|  updated_at  |  timestamp  |  null: false  |
|  user_id  |  references  |  null: false, foreign: true  |

### Asociation

- belongs_to :item
- belongs_to :user
- has_one :deliver_address



## deliver_addresses

|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  id  |  integer  |    |
|  postal_code  |  integer  |  null: false  |
|  prefectures  |  string   |  null: false  |
|  city  |  string  |  null: false  |
|  address  |  string  |  null: false  |
|  building_name  |  string  |  null: false  |
|  tel_num  |  string  |  null: false  |
|  created_at  |  datestamp  |  null: false  |
|  updated_at  |  datestamp  |  null: false  |
|  purchase_id  |  references  |  null: false, foreign_key:true |


## Asociation

- belongs_to :purchase