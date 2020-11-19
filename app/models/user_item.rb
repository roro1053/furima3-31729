class UserItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :citr, :house_number, :building_name, :phone_number, :postal_cord, :buy_record

 with_options presence: true do
  validates :city, format: 
  validates :house_number
  validates :phone_number, format: {with: /\A[0-9]{11}+\z/}
  validates :postal_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
 end
 
 def save
  BuyRecord.create(user_id: user.id,item_id: item.id)
  ShippingAddress.create(prefecture_id: purefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,postal_number: postal_number,buy_record_id: buy_record.id)
 end
end