class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.integer    :food_item_id
      t.float      :quantity
      t.integer    :unit_id
      t.text       :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end