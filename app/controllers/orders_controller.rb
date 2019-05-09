class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_authorized, only: :show

  def new
    @app = App.find(params[:apps_id])
    @order = Order.new
    @order.user_id = current_user.id
    @order.order_price = (@app.price*100).to_i
  end

  def create
    @app = App.find(params[:apps_id])
    @amount = (@app.price*100).to_i
    user = current_user.id
    @order = Order.new({:user_id=>user,:order_price=>@amount})
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken]
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'aud',
    })
    if @order.save
      redirect_to order_path(@app.id, @order.id)
    else
      @order.errors
      render 'new'
    end
  end

  def show
    @app = App.find(params[:apps_id])
    @order = Order.find(params[:id])
    @user_profile = @order.user.user_profile
    @generated_download_link = "http://www.appspace.com/" + Faker::File.file_name()
  end

  private

  def check_if_user_authorized
    @order = Order.find(params[:id])
    if user_signed_in?
      if current_user != @order.user
        flash[:error_not_auth] = "Sorry, you are not authorized to access this resource"
        redirect_to apps_path
      end
    end
  end
end

