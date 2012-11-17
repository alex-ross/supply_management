class Supplier < ActiveRecord::Base
  attr_accessible :address, :city, :country,
                  :name, :url, :zip, :phone, :email
end
