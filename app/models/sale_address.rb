class SaleAddress
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
  end
  validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: "can't be blank" }

  def save
    sale = Sale.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, area_id: area_id, municipality: municipality, address: address, building: building, phone_number: phone_number, sale_id: sale.id)
  end
end
