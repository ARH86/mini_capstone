class Api::CartedProductsController < ApplicationController

  def index
    @carted_product = CartedProduct.all

    if current_user
      @carted_products = current_user.carted_products.where(status: "carted")
    end

    render 'show.json.jbuilder'
  end

  def create
    @carted_product = CartedProduct.new(
                                        product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        user_id: current_user.id,
                                        status: "carted"
                                        )
    if @carted_product.save
     render 'show.json.jbuilder'
    else
     render json: {message: @carted_product.errors.full_messages}
    end
  end
end