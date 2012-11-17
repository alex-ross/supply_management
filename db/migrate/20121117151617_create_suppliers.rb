class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :zip
      t.string :city
      t.string :country
      t.string :url

      t.timestamps
    end

    add_index :suppliers, :name
  end
end
