class ChangeOwnerId < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :owner_id, :integer, null: true
  end
end
