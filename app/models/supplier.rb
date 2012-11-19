class Supplier < ActiveRecord::Base
  attr_accessible :address, :city, :country, :name, :url, :zip, :phone,
                  :email, :category_names

  has_and_belongs_to_many :categories

  def add_category(category)
    categories << Category.find_or_create_by_name(category.name)
  end

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.country}"
  end

  def category_names
    categories.map(&:name).join(',')
  end

  def category_names=(string)
    string.split(',').each do |category|
      categories << Category.find_or_create_by_name(category)
    end
  end
end
