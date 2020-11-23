class BuyRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_user_item, only: [:index, :create]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.buy_record.present?
      redirect_to root_path
    end
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new(user_item_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_item_params
    params.require(:user_item).permit(:prefecture_id, :city, :house_number, :building_name, :phone_number, :postal_cord).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_item_params[:token],
      currency: 'jpy'
    )
  end

  def set_user_item
    @item = Item.find_by(id: params[:item_id])
  end
end
