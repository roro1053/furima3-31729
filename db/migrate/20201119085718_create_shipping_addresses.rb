class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
     # t.integer :prefecture_id 
     # t.string :city
     # t.string :house_number
     # t.string :building_name
     # t.string :phone_number
     # t.string :postal_cord
     # t.references :buy_record, foreign_key: true
     # t.timestamps
    end
  end
end
