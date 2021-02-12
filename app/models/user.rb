class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


validates :nickname, presence: true
validates :password, presence: true, length: { minimum: 6 }, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
validates :password_confirmation, presence: true
validates :name_ue, presence: true, format:{ with: /[ぁ-んァ-ヶ一-龥々]/ }
validates :name_shita, presence: true, format:{ with: /[ぁ-んァ-ヶ一-龥々]/ }
validates :kana_ue, presence: true, format:{ with:/[ァ-ヶ]/ }
validates :kana_shita, presence: true, format:{ with:/[ァ-ヶ]/ }
validates :birthday, presence: true

end