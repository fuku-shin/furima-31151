class Address < ApplicationRecord
  belongs_to :sale

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
