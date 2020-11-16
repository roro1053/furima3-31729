class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]

  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:price,:comment,:name,:shipping_day_id,:shipment_source_id,:delivery_fee_id,:category_id,:status_id,:image).merge(user_id: current_user.id)
  end

 

end
