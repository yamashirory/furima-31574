class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
validates :nickname
validates :password, length: { minimum: 6 }, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
validates :birthday
end

with_options presence: true, format: { with: /[ぁ-んァ-ヶ一-龥々]/ } do
validates :name_ue
validates :name_shita
end

with_options presence: true, format: { with: /[ァ-ヶ]/ }do
validates :kana_ue
validates :kana_shita
end

end