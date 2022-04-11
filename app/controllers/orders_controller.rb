class OrdersController < ApplicationController
  before_action :move_to_find, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :region_id, :city, :address, :building, :phonenumber).merge(
      user_id: current_user.id, good_id: params[:good_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @good.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  private

  def move_to_find
    @good = Good.find(params[:good_id])
  end

  def move_to_index
    if current_user == @good.user
      redirect_to root_path
    end
    redirect_to root_path unless user_signed_in?
  end
end
