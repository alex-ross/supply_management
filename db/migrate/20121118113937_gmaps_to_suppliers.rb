class GmapsToSuppliers < ActiveRecord::Migration
  def up
    add_column :suppliers, :latitude,  :float #you can change the name, see wiki
    add_column :suppliers, :longitude, :float #you can change the name, see wiki
    add_column :suppliers, :gmaps, :boolean #not mandatory, see wiki
  end

  def down
    remove_column :suppliers, :latitude
    remove_column :suppliers, :longitudee
    remove_column :suppliers, :gmaps
  end
end
