FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    read_first_name { 'アイ' }
    read_last_name { 'ウエオ' }
    birthday { Faker::Date.birthday }
  end
end
