class Inventory < ActiveRecord::Base
  belongs_to :user
  
  has_many :pantry_items
  accepts_nested_attributes_for :pantry_items, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes['id'].blank? and attributes['food_item_name'].blank? }

  @@suggested_food_items = [
    "All-purpose flour",
    "Baking powder",
    "Baking soda",
    "Brown sugar",
    "Cornstarch",
    "Granulated sugar",
    "Maple syrup",
    "Tomato paste",
    "Tuna, chunk light",
    "Barbecue sauce",
    "Hot sauce",
    "Ketchup",
    "Mayonnaise",
    "Mustard",
    "Bread",
    "Oatmeal",
    "Pasta",
    "Tortilla",
    "White rice",
    "Canola oil",
    "Extra-virgin olive oil",
    "Apple",
    "Carrot",
    "Garlic",
    "Lemon",
    "Onion",
    "Orange",
    "Potato, russet",
    "Tomato",
    "Butter, Unsalted",
    "Cream cheese",
    "Egg",
    "Fruit juice",
    "Milk",
    "Black pepper",
    "Chives, fresh",
    "Cinnamon",
    "Cloves",
    "Cumin",
    "Ginger",
    "Nutmeg",
    "Oregano",
    "Paprika",
    "Rosemary",
    "Sage",
    "Salt",
    "Soy sauce",
    "Thyme",
    "Vanilla extract",
    "Worcestershire sauce",
    "Jam",
    "Peanut butter",
    "Popcorn",
    "Coffee",
    "Cold cereal",
  ]
  
  def build_suggested_items
    @@suggested_food_items.each do |item_name|
      pantry_items.build(:food_item => FoodItem.find_by_name(item_name),
        :quantity => 1, :unit => Unit.find_by_name("Package"))
    end
  end

  def self.suggested_food_items
    @@suggested_food_items
  end
end
