require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
    it '出品ができる' do
      expect(@item).to be_valid
    end
    end
    context '商品出品がうまくいかないとき' do
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリー情報が空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it '商品の状態について空では登録ができない' do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("State is not a number")
    end
    it '発送料の負担について空だと登録ができない' do
      @item.shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping is not a number")
    end
    it '発送元の地域について空だと登録ができない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area is not a number")
    end
    it '発送までの日数が空だと登録ができない' do
      @item.day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day is not a number")
    end
    it '価格が空だと登録ができない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end
    it '価格の範囲が¥300以下だと登録ができない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格の範囲が¥9,999,999以上だと登録ができない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '販売価格は半角数字しか登録ができない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it '商品画像１枚をつけないと登録ができない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'ユーザーが紐づいていないと登録ができない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    end
  end
end
