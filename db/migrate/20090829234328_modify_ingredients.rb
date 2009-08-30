class ModifyIngredients < ActiveRecord::Migration
  def self.up
    change_table :ingredients do |t|
      t.integer :recipe_id
    end
  end

  def self.down
    change_table :ingredients do |t|
      t.remove :recipe_id
    end
  end
end
