class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :read_first_name
    validates :read_last_name
    validates :birthday
  end
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}  do
    validates :first_name
    validates :last_name
  end
  with_options format: { with: /\A[ァ-ン]+\z/}  do
    validates :read_first_name
    validates :read_last_name
  end
end
