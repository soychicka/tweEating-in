class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.string     :name
      t.string     :abbreviation
      t.float      :conversion_ratio
      t.timestamps
    end
    [
      {:name => "cup", :abbreviation => "c", :conversion_ratio => 1},
      {:name => "tablespoon", :abbreviation => "Tb", :conversion_ratio => 0.0625},
      {:name => "teaspoon", :abbreviation => "tb", :conversion_ratio => 0.0208333333},
      {:name => "gallon", :abbreviation => "g", :conversion_ratio => 16},
      {:name => "slice", :abbreviation => "slice", :conversion_ratio => 1}
    ].each do |unit_hash|
      Unit.create(unit_hash)
    end
  end

  def self.down
    drop_table :units
  end
end
