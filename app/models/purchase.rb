class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :good
  has_one    :shipper
end
