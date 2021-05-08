FactoryBot.define do
  factory :item do
    association :user
    name          { Faker::Name.initials(number: 40) }
    info          { Faker::Lorem.sentence }
    price         { rand(300..9_999_999) }
    category_id   { rand(2..10) }
    status_id     { rand(2..7) }
    fee_status_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    delivery_id   { rand(2..4) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
