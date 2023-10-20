class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
    @item = @purchase.item

  end

  def create

  end
end
