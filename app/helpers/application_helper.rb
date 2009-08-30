# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def setup_recipe(recipe)
    returning(recipe) do |r|
      r.ingredients.build if r.ingredients.empty?
    end
  end
end
