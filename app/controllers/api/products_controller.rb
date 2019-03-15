class Api::ProductsController < ApiController
  def index
    @products = Product.all.to_json(except: [:id, :created_at, :updated_at])
    render json: @products
  end
end
