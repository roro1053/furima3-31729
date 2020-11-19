class UserItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :citr, :house_number, :building_name, :phone_number, :postal_cord, :buy_record
end