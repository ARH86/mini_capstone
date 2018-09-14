class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]


  def index
    @orders = current_user.orders
    render 'index.json.jbuilder' 
  end
  def create
    @order = Order.new(
                      user_id: current_user.id,
                      product_id: params[:product_id],
                      quantity: params[:quantity],
                      subtotal: params[:subtotal],
                      tax: tax,
                      total: total
                      )

    @orders.build_totals

    if @order.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
