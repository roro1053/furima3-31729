class CreateByRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :by_records do |t|

      t.timestamps
    end
  end
end
