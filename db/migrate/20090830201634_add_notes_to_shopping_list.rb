class AddNotesToShoppingList < ActiveRecord::Migration
  def self.up
    change_table :shopping_lists do |t|
      t.text :notes
    end
  end

  def self.down
    change_table :shopping_lists do |t|
      t.remove :notes
    end
  end
end
