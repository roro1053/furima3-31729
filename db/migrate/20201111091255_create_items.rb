class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :comment
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_fee_id
      t.integer :shipment_source_id
      t.integer :shipping_day_id
      t.timestamps
    end
  end
end
