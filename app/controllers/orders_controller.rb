class OrdersController < ApplicationController
  def index
    @order = Order.new
    @good = Good.find(params[:good_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :region_id, :city, :address, :building, :phonenumber, :purchase).merge(user_id: current_user.id)
  end
end