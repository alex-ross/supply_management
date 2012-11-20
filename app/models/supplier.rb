class Supplier < ActiveRecord::Base
  attr_accessible :address, :city, :country, :name, :url, :zip, :phone,
                  :email, :category_names, :note

  has_many :categoryships
  has_many :categories, through: :categoryships

  acts_as_gmappable

  validates :name, :address, :city, :country, presence: true

  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.country}"
  end

  # => "Category1,Category2"
  def category_names
    categories.map(&:name).join(',')
  end

  # Can be set as an array of category names or names separated by ',' as string
  def category_names=(list)
    list = list.is_a?(Array) ? list : list.split(',').reject(&:blank?).collect { |item| item.try(:strip) }
    delete_unused_categories(list)
    add_new_categories(list)
  end

  private
    def delete_unused_categories(list)
      old_categories = categories - Category.where(name: list)
      categories.delete(old_categories)
    end

    def add_new_categories(list)
      list.each do |item|
        categories << Category.find_or_create_by_name(item) unless categories.map(&:name).include?(item)
      end
    end
end
