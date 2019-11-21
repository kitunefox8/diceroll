class CreateEquips < ActiveRecord::Migration[5.2]
  def change
    create_table :equips do |t|

      t.timestamps
    end
  end
end
