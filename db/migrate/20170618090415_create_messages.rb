class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.integer :security
      t.string :link
      t.string :service
      t.integer :service_id
      t.boolean :already_read
      t.boolean :delete_flg

      t.timestamps
    end
  end
end
