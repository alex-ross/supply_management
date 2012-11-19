class SuppliersController < ApplicationController
  before_filter :find_supplier
  before_filter :get_suppliers, only: [:index, :show]
  before_filter :get_gmap_data, only: [:index, :show]


  def index
  end

  def show
    render action: "index"
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      redirect_to @supplier, notice: 'Supplier was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @supplier.update_attributes(params[:supplier])
      redirect_to @supplier, notice: 'Supplier was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_url
  end

  private
    def find_supplier
      @supplier = Supplier.find(params[:id]) if params[:id]
    end

    def get_suppliers
      if params[:q]
        @suppliers = Supplier.where("name LIKE ? OR city LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
      else
        @suppliers = Supplier.all
      end
    end

    def get_gmap_data
      @gmaps_data = @suppliers.to_gmaps4rails do |supplier, marker|
        marker.title supplier.name
        marker.infowindow "Hej"
        marker.sidebar "im the sidebar"
        marker.json({ id: supplier.id, name: supplier.name })
      end
    end
end
