class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :sales
  has_one :address
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :read_first_name
    validates :read_last_name
    validates :birthday
  end
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name
    validates :last_name
  end
  with_options format: { with: /\A[ァ-ン]+\z/ } do
    validates :read_first_name
    validates :read_last_name
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }
  validates :email, format: { with: /@+/ }
end
