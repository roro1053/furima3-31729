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

      it "建物名が空でも購入できる" do
        @user_item.building_name = ""
        expect(@user_item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it do
      end
    end





















  end
end