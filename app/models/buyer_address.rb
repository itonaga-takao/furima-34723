class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
    validates :municipality
    validates :address 
    validates :phone_number, format: { with: /\A\d{10,11}\z/ } 
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :user_id
    validates :item_id

  end   
  
  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, buyer_id: buyer.id )
   end
end 

