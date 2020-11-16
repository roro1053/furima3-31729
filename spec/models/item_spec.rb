require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品出品がうまくいく時' do
      it do
        "image,name,comment,priceの4つが存在し,category_id、status_id,delivery_fee_id,shipment_source_id,shipping_day_idの5つの値が2以上の時,priceの値が上限
      は10000000を下回る,下限は299を超える時且つ半角数値なら出品出来る"
        expect(@item).to be_valid
      end
      it 'priceが300以上なら出品出来る' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9999999以下なら出品出来る' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'commnetが空だと出品できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'cotegory_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'delivery_gee_idが1だと出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'shipment_source_idが1だと出品できない' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
      end
      it 'shippping_day_idが1だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end
      it 'priceが300より小さいと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999を超えると出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
