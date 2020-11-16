class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :sale
  has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :payment
  belongs_to :status
  belongs_to :category
  belongs_to :area
  belongs_to :days

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
  end
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  with_options numericality: { other_than: 1 } do
    validates :payment_id
    validates :status_id
    validates :area_id
    validates :days_id
    validates :category_id
  end
end
