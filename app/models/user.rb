class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
         

     with_options presence: true do
          validates :nickname
          validates :birthday
          validates :real_last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "is invalid. Input full-width katakana characters."}
          validates :real_first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "is invalid. Input full-width katakana characters."}
          validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
          validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
        end
      

        
      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX
      
        
          

end
