FactoryBot.define do
  factory :item do
    name                           {  Faker::Book.title }
    explanation                    {  Faker::Books::Dune.saying }
    category_id                    {  Faker::Number.between(from: 1 ,to: 5) }
    condition_id                   {  Faker::Number.between(from: 1 ,to: 5) }
    shipping_charge_bearer_id      {  Faker::Number.between(from: 1, to: 5) }
    shipping_area_id               {  Faker::Number.between(from: 1 ,to: 5) }
    days_untill_shipping_id        {  Faker::Number.between(from: 1 ,to: 5) }
    price                          {  Faker::Number.between(from: 300 ,to: 9999999) }
    
    association :user
  end
end
