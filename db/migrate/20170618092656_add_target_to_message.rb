class AddTargetToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :target_user, :integer
  end
end
