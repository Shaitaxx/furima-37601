class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :good
  has_one    :shipper

  with_options presence: true, foreign_key: true do
    validates :user, :good
  end
end