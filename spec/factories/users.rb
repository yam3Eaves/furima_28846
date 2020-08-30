FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a1b2c3"}
    password_confirmation {password}
    last_name             {"山口"}
    first_name            {"和也"}
    last_name_kana        {"ヤマグチ"}
    first_name_kana       {"カズヤ"}
    birthday              {"1997-03-22"}
  end
end
