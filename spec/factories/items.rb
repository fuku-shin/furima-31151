FactoryBot.define do
  factory :item do
    name { '商品名' }
    explanation { '商品の説明' }
    price { 10_000 }
    payment_id { 2 }
    status_id  { 2 }
    area_id  { 2 }
    days_id  { 2 }
    category_id { 2 }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
