class CreateBuyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_records do |t|
      t.references :user, foreign_key: ture
      t.references :item, foreign_key: ture
      t.timestamps
    end
  end
end
