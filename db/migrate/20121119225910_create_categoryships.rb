class CreateCategoryships < ActiveRecord::Migration
  def change
    create_table :categoryships do |t|
      t.integer :supplier_id
      t.integer :category_id

      t.timestamps
    end

    drop_table :categories_suppliers
  end
end
