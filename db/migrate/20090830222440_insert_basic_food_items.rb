class InsertBasicFoodItems < ActiveRecord::Migration
  def self.up
    Inventory.suggested_food_items.each do |item|
      FoodItem.create(:name => item)
    end
  end

  def self.down
    Inventory.suggested_food_items.each do |item|
      FoodItem.find_by_name(item).destroy
    end
  end
end
