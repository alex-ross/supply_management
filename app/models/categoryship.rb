class Categoryship < ActiveRecord::Base
  attr_accessible :category_id, :supplier_id, :supplier, :category

  belongs_to :category
  belongs_to :supplier
end
