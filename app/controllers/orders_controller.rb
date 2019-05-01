class OrdersController < ApplicationController
  def new
    @app = App.find(params[:id])
    @order = Order.new
    @order.user_id = current_user.id
    @order.order_price = (@app.price*100).to_i
  end

  def create

  end
end
