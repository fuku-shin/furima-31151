class Sale < ApplicationRecord
  has_one :address
  belongs_to :item
  belongs_to :user

  # 自分の学習用に保存。ここに記述すると、このテーブルにない情報を保存しようとしてうまくいかなくなる
  # attr_accessor :token
  # validates :token, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
