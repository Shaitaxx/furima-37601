class OrdersController < ApplicationController
  def index
    @order = Order.new
    @good = Good.find(params[:good_id])
  end

  def create
    @good = Good.find(params[:good_id])
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
end
