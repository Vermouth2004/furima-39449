class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.create(purchase_params)
    @address = Address.new(address_params)

    if @address.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end


  


  private
  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(purchase_id: @purchase.id)
  end
end
