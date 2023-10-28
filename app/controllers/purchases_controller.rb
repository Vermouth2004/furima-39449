class PurchasesController < ApplicationController

  def index
    # @purchase = Purchase.new
    # @item = Item.find(params[:item_id])
  end


  def new
    @purchase_address = PurchaseAddress.new
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
    
  end


  


  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(user_id: current_user.id)
  end

  
end
