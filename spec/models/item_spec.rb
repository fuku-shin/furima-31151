require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it 'image,name,explanation,price,patment_id,status_id,area_id,days_id,category_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '値段が300円以上なら出品できる' do
        @item.price >= 300
        expect(@item).to be_valid
      end
      it '値段が9999999円以下なら出品できる' do
        @item.price <= 9_999_999
        expect(@item).to be_valid
      end
      it '値段が半角なら出品できる' do
        @item.price <= 1000
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だとうまくいかない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だとうまくいかない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だとうまくいかない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'priceが空だとうまくいかない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is invalid', 'Price is not a number')
      end
      it 'payment_idが1だとうまくいかない' do
        @item.payment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Payment must be other than 1')
      end
      it 'status_idが1だとうまくいかない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'area_idが1だとうまくいかない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'days_idが1だとうまくいかない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 1')
      end
      it 'category_idが1だとうまくいかない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'priceが300未満だとうまくいかない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが10000000以上だとうまくいかない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが全角だとうまくいかない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
