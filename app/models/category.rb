class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :categoryships
  has_many :suppliers, through: :categoryships

  def name=(name)
    write_attribute(:name, name.try(:strip))
  end

  def as_json(options)
    { id: id, name: name }
  end
end
