FactoryBot.define do
  factory :order do
    postcode    { '123-4567' }
    region_id   { '2' }
    city        { '横浜市緑区' }
    address     { '青山1-1-1' }
    building    { '柳ビル103' }
    phonenumber { '09012345678' }
    user_id { '1' }
    good_id { '1' }
    purchase_id { '1' }
  end
end
