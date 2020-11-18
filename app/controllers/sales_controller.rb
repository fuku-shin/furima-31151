class SalesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id != @item.user.id
      redirect_to root_path
    end
    @sale_address = SaleAddress.new
  end


  def new
    @sale_address = SaleAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @sale_address = SaleAddress.new(sale_params)
    if @sale_address.valid?
      @sale_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def sale_params
  params.require(:sale_address).permit(:postal, :area_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end