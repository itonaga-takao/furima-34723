require 'rails_helper'

RSpec.describe Item, type: :model do
  
    before do
      @item = FactoryBot.build(:item)
    end

  describe '#create' do
    context '商品出品がうまくいくとき' do

      it 'image~priceまでの内容に問題ない場合登録できること' do
        expect(@item).to be_valid
      end
    end

   context '商品出品がうまくいかないとき' do

    it 'imageが空では出品できないこと' do
      @item.image = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では出品できないこと' do
      @item.name = ''
      @item.valid?

      expect(@item.errors.full_messages).to include("Name can't be blank")
    
end

    it 'detailが空では出品できないこと' do
      @item.details = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end

    it 'category_idが空では出品できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'status_idが空では出品できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'delivery_charge_idが空では出品できないこと' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it 'days_to_ship_idが空では出品できないこと' do
      @item.days_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end

    it 'prefecture_idが空では出品できないこと' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'priceが空では出品できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300以下では出品できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが¥9,999,999以上では出品できないこと' do
      @item.price = '100000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが半角数字以外では出品できないこと' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end


    end




end

end