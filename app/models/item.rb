class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true do

    validates :image
    validates :name
    validates :comment
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipment_source_id
    validates :shipping_day_id
    validates :price, format: { with: /\A\d+\z/}
    
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :shipping_day

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :shipment_source_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 } 
end
