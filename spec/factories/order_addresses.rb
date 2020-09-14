FactoryBot.define do
  factory :order_address do
    postal_code { '111-1111' }
    prefectures_id { Faker::Number.between(from: 1 ,to: 47) }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル103' }
    tel_num { 11112345678 }
    token  {'token_test'}
  end
end
