class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
validates :nickname
validates :password, length: { minimum: 6 }, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
validates :password_confirmation
validates :name_ue, format:{ with: /[ぁ-んァ-ヶ一-龥々]/ }
validates :name_shita, format:{ with: /[ぁ-んァ-ヶ一-龥々]/ }
validates :kana_ue, format:{ with:/[ァ-ヶ]/ }
validates :kana_shita, format:{ with:/[ァ-ヶ]/ }
validates :birthday
end

end