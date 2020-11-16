class Address < ApplicationRecord
  belongs_to :sale
  belongs_to :item
  belongs_to :user
end
