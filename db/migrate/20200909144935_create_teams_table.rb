class CreateTeamsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :Teams do |t|
      t.string :city
      t.string :mascot
      t.string :color
      t.integer :user_id
    end
  end
end
