class AddThirstModifierAndHungerModifierToAnimals < ActiveRecord::Migration[7.2]
  def change
    add_column :animals, :thirst_modifier, :float
    add_column :animals, :hunger_modifier, :float
  end
end
