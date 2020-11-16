class SaleAddress

  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id :municipality, :address, :building, :phone_number

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
  end
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

    def save
      user = User.create(nickname: nickname, email: email, first_name: first_name, last_name: last_name, readfirst_name: readfirst_name, readlast_name: readlast_name, birthday:birthday)
      item = Item.create(name: name, explanation:explanation, price:price, payment_id: payment_id, status_id: status_id,day_id: day_id,category_id:category_id)
      Address.create(postal:postal, prefecture_id: prefecture_id, municipality:municipality, address:address,building:building,phone_number:phone_number)
      Sale.crfeate(user_id:user.id, item_id:item.id)
    end
end

