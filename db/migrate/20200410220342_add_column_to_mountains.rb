class AddColumnToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :user_id, :integer
  end
end
