class Order
  include ActiveModel::Model
  attr_accessor :user_id, :good_id, :postcode, :region_id, :city, :address, :building, :phonenumber, :purchase_id, :token

  validates :postcode,
            format: { with: /\A\d{3}-\d{4}$|^\d{3}-\d{2}$|^\d{3}\z/,
                      message: 'is invalid. Input half-width character string of 3 digits hyphen 4 digits.' }
  validates :phonenumber, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width numbers.' }

  with_options presence: true do
    validates :postcode, :region_id, :city, :address, :phonenumber, :user_id, :good_id, :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, good_id: good_id)
    shipper = Shipper.create(postcode: postcode, region_id: region_id, city: city, address: address, building: building,
                             phonenumber: phonenumber, purchase_id: purchase.id)
  end
end
