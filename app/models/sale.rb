class Sale < ApplicationRecord
  has_one :address
  belongs_to :item
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  
end
