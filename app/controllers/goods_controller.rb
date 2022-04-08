class GoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_find, except: [:index, :new, :create]
  before_action :move_to_index, only: :edit

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
  end

  def edit
  end

  def update
    if @good.update(good_params)
      redirect_to good_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in?
      @good.destroy
      redirect_to root_path
    end
  end

  private

  def good_params
    params.require(:good).permit(:name, :explanation, :category_id, :status_id, :charge_id, :region_id, :shipping_date_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_find
    @good = Good.find(params[:id])
  end

  def move_to_index
    unless current_user == @good.user
      redirect_to root_path
    end
  end
end
