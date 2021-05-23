FactoryBot.define do
  factory :user_buy do
    postal_code { '123-1234' }
    prefecture_id { 2 }
    city { '渋谷' }
    addresses { '1' }
    building { 'どこかのびる' }
    phone_number { 99_912_341_234 }
    order_id { 1 }
    token { 'aaaa' }
  end
end
