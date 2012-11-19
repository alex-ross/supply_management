class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_and_belongs_to_many :suppliers

  def name=(name)
    write_attribute(:name, name.try(:strip))
  end

  def as_json(options)
    { id: id, text: name }
  end
end
