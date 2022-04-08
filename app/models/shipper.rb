class Shipper < ApplicationRecord
  validates :purchase, foreign_key: true

  belongs_to :purchase

  with_options presence: true do
    validates :postcode, :region_id, :city, :address, :phonenumber, :purchase
  end
end