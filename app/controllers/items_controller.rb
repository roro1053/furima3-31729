class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:shipment_source_id,:delivery_fee_id,:category_id,:status_id,:image).merge(user_id: current_user.id)
  end

end
