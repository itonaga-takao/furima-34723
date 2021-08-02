class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @buyeraddress = BuyerAddress.new
  end



  def create
   
    @buyeraddress =  BuyerAddress.new(buyeraddress_params)
    if @buyeraddress.valid? 
      pay_item
       @buyeraddress.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
      @item = Item.find(params[:item_id])
  end

  def buyeraddress_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item[:price], 
      card: buyeraddress_params[:token],    
      currency: 'jpy'                 
    )
  end


  def contributor_confirmation
   return redirect_to root_path if current_user.id == @item.user.id || @item.buyer != nil
  end


  

end
