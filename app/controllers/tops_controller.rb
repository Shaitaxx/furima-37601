class TopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @goods = Good.all.order("created_at DESC")
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @good = Good.find(params[:id])
  end

  private

  def good_params
    params.require(:good).permit(:name, :explanation, :category_id, :status_id, :charge_id, :region_id, :shipping_date_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
