class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :real_last_name, presence: true
         validates :real_first_name, presence: true  
         validates :kana_last_name, presence: true
         validates :kana_first_name, presence: true
         validates :birthday, presence: true

end
