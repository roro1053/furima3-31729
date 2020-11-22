require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe "商品の購入" do
    before do
      @user_item = FactoryBot.build(:user_item)
    end

    context '商品購入がうまくいく時' do
      it "全ての情報が正しく入力された時に購入できる" do
        expect(@user_item).to be_valid
      end
      it "building_nameが空でも購入できる" do
        @user_item.building_name = ""
        expect(@user_item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it "postal_cordが空だと購入できない" do
        @user_item.postal_cord = ""
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal cord can't be blank")
      end
      it "postal_cordにハイフンが入っていないと購入できない" do
        @user_item.postal_cord = "0009999"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal cord is invalid. Include hyphen(-)")
      end
      it "postal_cordが全角数字だと購入できない" do
        @user_item.postal_cord = "０００-００００"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal cord is invalid. Include hyphen(-)")
      end
      it "prefecture_idが1だと購入できない" do
        @user_item.prefecture_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "house_numberが空だと購入できない" do
        @user_item.house_number = ""
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空だと購入できない" do
        @user_item.phone_number = ""
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが全角数字だと購入できない" do
        @user_item.phone_number = "０９０３３３３５５５５"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberにハイフンが入ると購入できない" do
        @user_item.phone_number = "090-2222"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが11桁を超えると購入できない" do
        @user_item.phone_number = "090444455555"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
