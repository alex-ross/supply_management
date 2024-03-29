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
      redirect_to @supplier, notice: I18n.t('supplier_created')
    else
      render action: "new"
    end
  end

  def update
    if @supplier.update_attributes(params[:supplier])
      redirect_to @supplier, notice: I18n.t('supplier_updated')
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
        @q = params[:q]
        categories = Category.where("name like ?", "%#{@q}%").map(&:supplier_ids)
        @suppliers = Supplier.where("name like ?", "%#{@q}%") + Supplier.where(id: categories)
      else
        @suppliers = Supplier.all
      end
    end

    def get_gmap_data
      @gmaps_data = @suppliers.to_gmaps4rails do |supplier, marker|
        marker.title supplier.name
        marker.infowindow "<strong>#{supplier.name}</strong>"
        marker.json({ id: supplier.id, name: supplier.name })
      end
    end
end
