class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    
  end

  def edit
    return if @item.user == current_user && @item.purchase.blank?

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id 
       @item.destroy
    end
    redirect_to root_path
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :shipping_charge_id, :prefecture_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end
end
