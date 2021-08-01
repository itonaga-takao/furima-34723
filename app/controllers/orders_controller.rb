class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_signed_in, only: [:index]
  before_action :contributor_confirmation, only: [:index]

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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: buyeraddress_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sign_in'
    end
  end

  def contributor_confirmation
    redirect_to root_path  current_user == @item.user
  end

  

end
