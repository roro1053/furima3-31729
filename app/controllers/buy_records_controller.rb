class BuyRecordsController < ApplicationController

def index
  @item = Item.find_by(id: params[:item_id])

  @user_item = UserItem.new
  
end

def create
  @user_item = UserItem.new(user_item_params)
  if @user_item.valid?
    @user_item.save
    redirect_to root_path
  else 
    @item = Item.find_by(id: params[:item_id])
    render :index
  end

end

private

def user_item_params
  params.require(:user_item).permit(:prefecture_id, :city, :house_number, :building_name, :phone_number, :postal_cord).merge(user_id: current_user.id, item_id: params[:item_id])
end

end
