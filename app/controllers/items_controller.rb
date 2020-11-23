class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update,:destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show

  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
    redirect_to action: :index 
    return
    end
    unless @item.buy_record.nil?
     redirect_to action: :index
     return
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    unless 
      user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end

    if @item.destroy
    redirect_to root_path 
    end
  end

  private

  def item_params
    params.require(:item).permit(:price, :comment, :name, :shipping_day_id, :shipment_source_id, :delivery_fee_id, :category_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
