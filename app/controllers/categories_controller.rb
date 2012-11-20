class CategoriesController < ApplicationController

  respond_to :json
  # GET /categories
  # GET /categories.json
  def index
    respond_with(@categories = Category.all)
  end
end
