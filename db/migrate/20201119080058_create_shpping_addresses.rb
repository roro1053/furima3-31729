class CreateShppingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shpping_addresses do |t|

      t.timestamps
    end
  end
end
