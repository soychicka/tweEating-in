class ModifyPantryItemsAddInventoryId < ActiveRecord::Migration
  def self.up
    change_table :pantry_items do |t|
      t.integer :inventory_id
    end
  end

  def self.down
    change_table :pantry_items do |t|
      t.remove :inventory_id
    end
  end
end
