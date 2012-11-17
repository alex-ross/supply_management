class CreateCategoriesSuppliers < ActiveRecord::Migration
  def change
    create_table :categories_suppliers do |t|
      t.integer :supplier_id
      t.integer :category_id
    end
  end
end
