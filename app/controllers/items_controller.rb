class ItemsController < ApplicationController
  # ログインしていないユーザーは一覧と詳細以外にアクセスするとログイン画面に遷移
 before_action :authenticate_user!, except: [:index, :show]
  #ログインしていても、出品者でないと編集ページに遷移しない
 before_action :correct_user, only: [:edit, :update]
 
 before_action :set_item, only: [:show, :edit, :update, :destroy]


 def index
  
  @items = Item.all.order("created_at ASC")
 end

 def new
  @item = Item.new
 end
 
 def create
  
  @item = Item.new(item_params)
  if @item.save
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
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
   end
 end

 def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show 
    end
 end
  
 private


  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_charge_bearer_id, :shipping_area_id, :days_untill_shipping_id, :price, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
