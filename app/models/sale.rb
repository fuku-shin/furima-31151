class Sale < ApplicationRecord
  has_one :address
  belongs_to :item
  belongs_to :user

  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  
  
end
