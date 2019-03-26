class Api::V1::LandingsController < ApiController

  def show
    landing = Landing.find(params[:landing_id])
    products = landing.products.to_json
    render json: products
  end

end
