class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable, :recoverable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :address, :zip, :city, :country
  # attr_accessible :title, :body
  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.country}"
  end
end
