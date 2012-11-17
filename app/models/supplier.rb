class Supplier < ActiveRecord::Base
  attr_accessible :address, :city, :country, :name, :url, :zip, :phone,
                  :email, :categories_attributes

  has_and_belongs_to_many :categories

  def add_category(category)
    categories << Category.find_or_create_by_name(category.name)
  end
end
