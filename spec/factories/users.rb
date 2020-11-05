FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { 'ab@cd.com' }
    password { Faker::Internet.password }
    password_confirmation { password }
    first_name {'阿いウ'}
    last_name {'阿いウ'}
    read_first_name { 'アイ' }
    read_last_name { 'ウエオ' }
    birthday { Faker::Date.birthday }
  end
end
