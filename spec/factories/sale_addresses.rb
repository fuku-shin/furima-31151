FactoryBot.define do
  factory :sale_address do
    postal { '123-4567' }
    area_id { '2' }
    municipality {'あ市'}
    address { '1-1' }
    phone_number { '09011112222' }
  end
end
