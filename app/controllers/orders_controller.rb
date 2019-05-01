class OrdersController < ApplicationController
  def new
    @app = App.find(params[:id])
    @order = Order.new
    @order.user_id = current_user.id
    @order.order_price = (@app.price*100).to_i
  end

  def create
    @app = App.find(params[:id])
    @amount = (@app.price*100).to_i
    user = current_user.id
    @order = Order.new({:user_id=>user,:order_price=>@amount})
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'aud',
    })
    if @order.save
      redirect_to apps_path
    else
      @order.errors
      render 'new'
    end
  end

  def show
  end
end
