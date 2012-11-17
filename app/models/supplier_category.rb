class SupplierCategory < ActiveRecord::Base
  attr_accessible :category_id, :supplier_id

  has_many :categories
  has_many :suppliers
end
