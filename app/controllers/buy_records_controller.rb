class BuyRecordsController < ApplicationController

def index
  @user_item = UserItem.new
  @item = Item.find_by(id: params[:item_id])
end

def create
  @user_item = UserItem.new(user_item_params)
  @user_item.save

end

private

def user_item_params
  params.require(:user_item).permit(:prefecture_id, :city, :house_number, :building_name, :phone_number, :postal_cord).merge(user_id: current_user.id, item_id: params[:item_id])
end

end
