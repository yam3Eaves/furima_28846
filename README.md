# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## users table
|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  nickname  |  string  |  null: false   |
|  email  |  string  |   null: false, unique: true  |
|  password  |  string  |   null: false  |
|  last_name  |  string  |  null: false   |
|  first_name  |  string  |  null: false   |
|  last_name_kana  |  string  |  null: false   |
|  first_name_kana  |  string  |  null: false   |
|  birthday  |  date  |  null: false   |


### Association

- has_many :items
- has_many :orders


## items
|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  name  |  string  |  null: false  |
|  explanation  |  text  |  null: false  |
|  category_id  |  integer  |  null: false  |
|  condition_id  |  integer  |  null: false  |
|  sipping_charge_bearer_id  |  integer  |  null: false |
|  shipping_area_id | integer  |  null: false |
|  days_untill_shipping_id  |  integer  |  null: false |
|  price  |  integer  |  null: false  |
|  user  |  references  |  null: false, foreign_key: true  |


### Association
- belongs_to :user
- has_one :order



## orders
|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  user  |  references  |  null: false, foreign_key: true  |
|  item  |  references  |  null: false, foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address



## addresses

|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  postal_code  |  string  |  null: false  |
|  prefectures  |  integer   |  null: false  ｜
|  city  |  string  |  null: false  |
|  address  |  string  |  null: false  |
|  building_name  |  string  |    |
|  tel_num  |  string  |  null: false  |
|  order  |  references  |  null: false, foreign_key:true |


## Association

- belongs_to :order