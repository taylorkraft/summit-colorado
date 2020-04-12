class CreateSummits < ActiveRecord::Migration
  def change
    create_table :summits do |t|
      t.integer :user_id
      t.integer :mountain_id
      t.boolean :summited, null: :false, default: :false
    end
  end
end
