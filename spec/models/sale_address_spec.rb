require 'rails_helper'

RSpec.describe SaleAddress, type: :model do
  describe '商品購入機能' do
    before do
      @sale_address = FactoryBot.build(:sale_address)
    end
    context '商品が購入できるとき'
    it 'postal,area_id,municipality,address,phone_numberが入力されていれば購入できる' do
    expect(@sale_address).to be_valid
    end

    context '商品が購入できないとき'
    it 'postalがからだと購入できない' do
      @sale_address.postal = nil
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Postal can't be blank")
    end
    it 'postalに-がないと購入できない' do
      @sale_address.postal = '1234567'
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
    end
    it 'postalが全角だと購入できない' do
      @sale_address.postal = '１２３-4567'
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
    end
    it 'area_idが0だと購入できない' do
      @sale_address.area_id = '0'
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include()
    end
    it 'manicipalityがからだと購入できない' do
      @sale_address.municipality = nil
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressがからだと購入できない' do
      @sale_address.address = nil
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberがからだと購入できない' do
      @sale_address.phone_number = nil
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが11けたより多いと購入できない' do
      @sale_address.phone_number = "111111111111"
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Phone number can't be blank")
    end

  end

end


