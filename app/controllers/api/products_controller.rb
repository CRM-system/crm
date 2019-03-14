class Api::ProductsController < ApiController
  def index
    @products = Product.all.to_json
    render json: @products
  end
end
