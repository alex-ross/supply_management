class AddNotesToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :note, :text
  end
end
