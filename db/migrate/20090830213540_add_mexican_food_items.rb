class AddMexicanFoodItems < ActiveRecord::Migration
  @@item_names = [
    "Cilantro",
    "Shrimp",
    "Strip Steak",
    "Sour Cream",
    "Black Beans",
    "Cayenne",
    "Guajillo",
    "Lettuce",
    "Rice"
  ]
  def self.up
    @@item_names.each do |item|
      FoodItem.create(:name => item)
    end
  end

  def self.down
    @@item_names.each do |item|
      FoodItem.find_by_name(item).destroy
    end
  end
end
