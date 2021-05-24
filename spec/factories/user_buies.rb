FactoryBot.define do
  factory :user_buy do
    postal_code { '123-1234' }
    prefecture_id { 2 }
    city { '渋谷' }
    addresses { '1' }
    building { 'どこかのびる' }
    phone_number { '09012341234' }
    token { 'aaaa' }
  end
end
