class Good < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :region
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image

  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'is invalid' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id, :status_id, :charge_id, :region_id, :shipping_date_id
  end
  with_options presence: true do
    validates :image, :name, :explanation, :category_id, :status_id, :charge_id, :region_id, :shipping_date_id, :price
  end
end
