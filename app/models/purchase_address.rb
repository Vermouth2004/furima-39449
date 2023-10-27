class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :purchase_id, :user_id, :item_id



  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}[-][0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{10, 11}\z/ }
    validates :purchase_id
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building, phone_number: phone_number, purchase_id: purchase.id)
  end



end
