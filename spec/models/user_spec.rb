require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
    it '新規登録ができる' do
      expect(@user).to be_valid
    end
    end
    context '新規登録がうまくいかないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailがすでにある場合は登録できない' do
      @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは＠がないと登録できない' do
      @user.email = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password is too short (minimum is 6 characters)", "Password is invalid", "Password confirmation doesn't match Password")
    end
    it 'passwordは６文字以上でないと登録できない' do
      @user.password = 'aaaa1'
      @user.password_confirmation = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is too short (minimum is 6 characters)")
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordは確認用も含めて２回入力しないと登録できない' do
      @user.password = 'aaaaa1'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation can't be blank")
    end
    it 'passwordは確認用と一致しないと登録できない' do
      @user.password = 'aaaaa1'
      @user.password_confirmation = 'aaaaa2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'name_ueが空では登録ができない' do
      @user.name_ue = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ue can't be blank", "Name ue is invalid")
    end
    it 'name_shitaが空では登録ができない' do
      @user.name_shita = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name shita can't be blank", "Name shita is invalid")
    end
    it 'name_ueは全角でないと登録できない' do
      @user.name_ue = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ue is invalid")
    end
    it 'name_shitaは全角でないと登録できない' do
      @user.name_shita = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name shita is invalid")
    end
    it 'kana_ueが空では登録できない' do
      @user.name_ue = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ue can't be blank", "Name ue is invalid")
    end
    it 'kana_shitaが空では登録できない' do
      @user.name_shita = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name shita can't be blank", "Name shita is invalid")
    end
    it 'kana_ueはカタカナの入力が必須である' do
      @user.kana_ue = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana ue is invalid")
    end
    it 'kana_shitaはカタカナの入力が必須である' do
      @user.kana_shita = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana shita is invalid")
    end
    it 'birthdayの入力は必須である' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
  end
end
