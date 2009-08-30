# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def setup_recipe(recipe)
    returning(recipe) do |r|
      (r.ingredients.length...7).each {r.ingredients.build}
    end
  end
  def setup_inventory(inventory)
    returning(inventory) do |i|
      (i.pantry_items.length...7).each {i.pantry_items.build}
    end
  end
end
