class CreatePayItemDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_item_details do |t|
      t.integer :_id
      t.integer :pay_item_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
