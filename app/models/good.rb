class Good < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :region
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
  validates :user, presence: true
end
