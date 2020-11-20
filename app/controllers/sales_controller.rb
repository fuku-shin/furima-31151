class SalesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.sale != nil
      redirect_to root_path
    end
    @sale_address = SaleAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @sale_address = SaleAddress.new(sale_params)
    if @sale_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: sale_params[:token],   
        currency: 'jpy'                 
      )
      @sale_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sale_params
  params.require(:sale_address).permit(:postal, :area_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end