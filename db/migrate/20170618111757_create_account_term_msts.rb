class CreateAccountTermMsts < ActiveRecord::Migration[5.1]
  def change
    create_table :account_term_msts do |t|
      t.integer :year
      t.integer :month
      t.date :start_date
      t.date :end_date
      t.boolean :closed

      t.timestamps
    end
  end
end
