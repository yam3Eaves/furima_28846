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
- has_many :purchasers


## items
|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  img_url  |  string  |  null: false   |
|  name  |  string  |  null: false  |
|  explanation  |  text  |  null: false  |
|  category  |  integer  |  null: false  |
|  condition  |  integer  |  null: false  |
|  sipping_charge_bearer  |  integer  |  null: false |
|  shipping_area | integer  |  null: false |
|  days_untill_shipping  |  integer  |  null: false |
|  price  |  integer  |  null: false  |
|  user  |  references  |  null: false, foreign_key: true  |


### Asociation
- belongs_to :user
- has_one :purchase



## purchasers
|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  user  |  references  |  null: false, foreign: true  |

### Asociation

- belongs_to :item
- belongs_to :user
- has_one :deliver_address



## deliver_addresses

|  Column  |  Type  |  Options  | 
| ---- | ---- | ----|
|  postal_code  |  string  |  null: false  |
|  prefectures  |  integer   |  null: false  ｜
|  city  |  string  |  null: false  |
|  address  |  string  |  null: false  |
|  building_name  |  string  |    |
|  tel_num  |  string  |  null: false  |
|  purchase  |  references  |  null: false, foreign_key:true |


## Asociation

- belongs_to :purchase