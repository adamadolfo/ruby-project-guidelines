class AddBossBoolColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :is_boss, :boolean
  end
end
