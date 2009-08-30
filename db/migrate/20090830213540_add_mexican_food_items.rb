class AddMexicanFoodItems < ActiveRecord::Migration
  @@item_names = [
    "Cilantro",
    "Tomato",
    "Onion",
    "Shrimp",
    "Strip Steak",
    "Cheese",
    "Sour Cream",
    "Black Beans",
    "Cumin",
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
