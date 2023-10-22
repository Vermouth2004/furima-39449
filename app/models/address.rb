class Address < ApplicationRecord
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true
  
  belongs_to :purchase

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :postal_code, format: { with: /\A[0-9]{3}[-][0-9]{4}\z/ }
  
  validates :phone_number, format: { with: /\A[0-9]{10, 11}\z/ }


  





end

