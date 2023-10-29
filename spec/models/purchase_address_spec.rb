require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end
  describe '購入記録情報の保存' do 
    context '購入記録が保存できる場合' do
      it 'すべての値が正しく入力されておりtokenがあれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ""
        expect(@purchase_address).to be_valid


      end
    end

    context '購入記録が保存できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        

      end
      it 'postal_codeが全角文字を含む場合は保存できないこと' do
        @purchase_address.postal_code = '０80-1155'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeがハイフンを含まない場合は保存できないこと' do
        @purchase_address.postal_code = '1145522'
        @purchase_address.valid?
	
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
        

      end
      it 'postal_codeが「3桁ハイフン4桁」の形式でない場合は保存できないこと' do
        @purchase_address.postal_code = '1155-141'
        @purchase_address.valid?
	
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
        

      end

      

      it 'prefecture_idが空では保存できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1の時は保存できない' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")

      end
      it 'street_addressが空だと保存できないこと' do
        @purchase_address.street_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")

      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")

      end
      it 'phone_numberが10桁以上11桁以内でなければ保存できないこと' do
        @purchase_address.phone_number = 0504561
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")




      end
      it 'phone_numberが全角数値を含む場合は保存できないこと' do
        @purchase_address.phone_number = '０8054295417'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")




      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")

      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")


      end
      it "tokenが空では保存できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")

      end


      
      
    end
  end
end
