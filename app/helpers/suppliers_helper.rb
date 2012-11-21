module SuppliersHelper
  def distance(object_from, object_to)
    dest = Gmaps4rails.destination({from: object_from.gmaps4rails_address, to: object_to.gmaps4rails_address})
    "#{dest.first["distance"]["text"]} from your store!"
  rescue
    ""
  end
end
