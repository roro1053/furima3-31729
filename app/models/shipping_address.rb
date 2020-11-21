class ShippingAddress < ApplicationRecord
  belongs_to :buy_record
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
