class OrdersController < ApplicationController
  #ログインしていないユーザーはログインページに遷移する
  before_action :authenticate_user!
  #出品者が購入ページに遷移を試みた場合、トップページに遷移
  before_action :go_index_seller, only: [:index, :create]
  #購入済商品の購入ページにURLから遷移しようとするとトップページに遷移する
  before_action :go_index_soldout, only: [:index, :create]

  def index  
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit( :token, :postal_code, :prefectures_id, :city, :address, :building_name, :tel_num, :item_id).merge(user_id: current_user.id, item_id: @item.id)
  end 
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price ,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def go_index_seller
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
  end

  def go_index_soldout
    @order = Order.find_by(item_id: params[:item_id])
    if @order != nil
       redirect_to root_path
    end
  end
end
