FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { 'sample1' }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    last_name_kana        { Gimei.last.katakana }
    first_name            { Gimei.first.kanji }
    first_name_kana       { Gimei.first.katakana }
    birth_day             { Faker::Date.in_date_period }
  end
end
