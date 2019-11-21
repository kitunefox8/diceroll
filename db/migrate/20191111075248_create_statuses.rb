class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :life
      t.integer :character_id
      t.timestamps
    end
  end
end
