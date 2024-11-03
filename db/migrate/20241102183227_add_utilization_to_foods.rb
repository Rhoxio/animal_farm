class AddUtilizationToFoods < ActiveRecord::Migration[7.2]
  def change
    add_column :foods, :utilization, :integer, default: 0
  end
end
