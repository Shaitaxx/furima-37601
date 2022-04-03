FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { 'あああ' }
    first_name            { 'あああ' }
    family_name_kana      { 'アアア' }
    first_name_kana       { 'アアア' }
    birthday              { '1988-10-20' }
  end
end
