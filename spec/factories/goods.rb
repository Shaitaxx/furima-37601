FactoryBot.define do
  factory :good do
    name              { Faker::Name.initials(number: 2) }
    explanation       { Faker::Lorem.sentence }
    category_id       { '2' }
    status_id         { '3' }
    charge_id         { '2' }
    region_id         { '3' }
    shipping_date_id  { '2' }
    price             { '999999' }

    association :user

    after(:build) do |good|
      good.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
