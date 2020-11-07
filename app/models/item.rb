class Item < ApplicationRecord
  has_one_attached:image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price     
    validates :payment_id
    validates :status_id
    validates :area_id
    validates :days_id
    validates :category_id
  end
    validates :price, format: {with: /\A[0-9]+\z/ }
    validates :price, numericality: { only_integer: true,greater_than: 300, less_than: 10000000}


end
