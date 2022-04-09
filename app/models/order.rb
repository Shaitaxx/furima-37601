class Order
  include ActiveModel::Model
  attr_accessor :user, :good, :postcode, :region_id, :address, :building :phonenumber, :purchase

  validates :postcode,    format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: 'is invalid. Input half-width character string of 3 digits hyphen 4 digits.' }
  validates :phonenumber, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width numbers.' }
  with_options presence: true do
    validates :postcode, :region_id, :city, :address, :phonenumber
  end
  with_options presence: true, foreign_key: true do
    validates :user, :good, :purchase
  end

  def save
    @shipper = Shipper.new(shipper_params)
    shipper.save
    @purchase = Purchase.new(shipper_params)
    purchase.save
  end
end