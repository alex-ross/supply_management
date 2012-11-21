module SuppliersHelper
  def distance(object_from, object_to)
    dest = Gmaps4rails.destination({from: object_from.gmaps4rails_address, to: object_to.gmaps4rails_address})
    I18n.t 'distance', distance: dest.first["distance"]["text"]
  rescue
    I18n.t 'distance_error'
  end
end
