require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が保存できる場合' do
      it 'nameとdetailとcategory_idとcondition_idとshipping_charge_idとprefecture_idとshipping_date_idとpriceとimageが存在していれば保存できる' do
        expect(@item).to be_valid
      end
      
    end
    context '商品情報が保存できない場合' do
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
        
      end     
      it 'detailが空では保存できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end     

      it 'category_idが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end     

      it 'condition_idが空では保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end     

      it 'shipping_charge_idが空では保存できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end     

      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end     

      it 'shipping_date_idが空では保存できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end     

      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end     

      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end 
      it 'category_idが1の時は保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end         
      it 'condition_idが1の時は保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end         
      it 'shipping_charge_idが1の時は保存できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end         
      it 'prefecture_idが1の時は保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end         
      it 'shipping_date_idが1の時は保存できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end  
      it 'priceが299以下の時は保存できない' do
        @item.price = '290'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")

      end  
      it 'priceが10,000,000以上の時は保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end  
     
      it 'priceに全角数字が含まれる時は保存できない' do
        @item.price = '1000０'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")

      end  
     

      it 'ユーザーが紐付いていなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")


      end
    end
  end
end
