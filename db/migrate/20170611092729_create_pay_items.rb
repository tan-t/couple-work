class CreatePayItems < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_items do |t|
      t.integer :_id
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
