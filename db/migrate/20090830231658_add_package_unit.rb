class AddPackageUnit < ActiveRecord::Migration
  def self.up
    Unit.create(:name => "Package", :abbreviation => "pkg", :conversion_ratio => 1 )
  end

  def self.down
    Unit.find_by_name("Package").destroy
  end
end
