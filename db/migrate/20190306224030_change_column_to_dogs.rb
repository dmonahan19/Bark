class ChangeColumnToDogs < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :owner_id, :integer, null: false
  end
end
