class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


validates :nickname, presence: true
validates :email, presence: true, uniqueness: true, inclusion: { in: "@" }
validates :encrypted_password, presence: true, length: { minimum: 6 }, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
validates :encrypted_password_confirmation, presence: true
validates :name_ue, presence: true, format:{ with: /[ぁ-んァ-ヶ一-龥々]/, message: '全角文字を使用してください' }
validates :name_shita, presence: true, format:{ with: /[ぁ-んァ-ヶ一-龥々]/, message: '全角文字を使用してください' }
validates :kana_ue, presence: true, format:{ with:/[ァ-ヶ]/, message: '全角文字を使用してください'}
validates :kana_shita, presence: true, format:{ with:/[ァ-ヶ]/, message: '全角文字を使用してください'}
validates :birthday, presence: true

end