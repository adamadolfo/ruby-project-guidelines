class CreatePlayersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :Players do |t|
      t.string :name
      t.integer :number
      t.string :position
      t.integer :points
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
    end
  end
end
