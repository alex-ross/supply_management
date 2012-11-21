module SuppliersHelper
  def distance(object_from, object_to)
    dest = Gmaps4rails.destination({from: object_from.gmaps4rails_address, to: object_to.gmaps4rails_address})
    "#{dest.first["distance"]["text"]} from you!"
  rescue
    "Your adress or suppliers address can't be found!"
  end
end
