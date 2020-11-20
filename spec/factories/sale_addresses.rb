FactoryBot.define do
  factory :sale_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal { '123-4567' }
    area_id { '2' }
    municipality { 'あ市' }
    address { '1-1' }
    building { 'あいうえおビル' }
    phone_number { '09011112222' }
  end
end
