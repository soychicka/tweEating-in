class InsertFoodItems < ActiveRecord::Migration
  def self.up
    bread = FoodItem.create(:name => "Bread")
    FoodItem.create(:name => "Wheat Bread", :parent_id => bread.id)

    meat = FoodItem.create(:name => "Sandwich Meat")
    FoodItem.create(:name => "Bologna", :parent_id => meat.id)
    FoodItem.create(:name => "Roast Turkey", :parent_id => meat.id)

    FoodItem.create(:name => "Mayonnaise")

    mustard = FoodItem.create(:name => "Mustard")
    FoodItem.create(:name => "Dijon Mustard", :parent_id => mustard.id)
    FoodItem.create(:name => "Yellow Mustard", :parent_id => mustard.id)
  end

  def self.down
    ["Bread", "Wheat Bread", "Sandwich Meat", "Bologna", "Roast Turkey",
     "Mayonnaise", "Mustard", "Dijon Mustard", "Yellow Mustard"].each do |f|
       FoodItem.find_by_name(f).destroy
     end
  end
end
