class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :days_to_ship
  belongs_to :prefecture
  has_one_attached :image
  belongs_to :user
  has_one :buyer

  with_options presence: true do
    validates :image
    validates :name
    validates :details
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

    with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :days_to_ship_id
    validates :prefecture_id



  end 

end
end
