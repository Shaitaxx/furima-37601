FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { 'あああ' }
    first_name            { 'あああ' }
    family_name_kana      { 'アアア' }
    first_name_kana       { 'アアア' }
    birthday              { 2015 - 10 - 20 }
  end
end
