require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buyer_address = FactoryBot.build(:buyer_address, item_id: @item.id, user_id: @user.id)
    sleep(0.1)
  end

describe '#create' do
  context '商品購入がうまくいくとき' do

    it 'カード情報~電話番号までの内容に問題ない場合登録できること' do
      expect(@buyer_address).to be_valid
    end

    it '建物名が空でも登録できること' do
      @buyer_address.building = ''
      expect(@buyer_address).to be_valid
    end

  end

  context '商品購入がうまくいかないとき' do

  it 'カード情報が空では購入できないこと' do
    @buyer_address.token = nil
    @buyer_address.valid?
  expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
  end

  it '有効期限が空では購入できないこと' do
    @buyer_address.token = ''
    @buyer_address.valid?

    expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
  
end

  it 'セキュリティコードが空では購入できないこと' do
    @buyer_address.token = ''
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
  end

  it '郵便番号が空では購入できないこと' do
    @buyer_address.postal_code = ''
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
  end

  it '都道府県が空では購入できないこと' do
    @buyer_address.prefecture_id = ''
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
  end

  it '市区町村が空では購入できないこと' do
    @buyer_address.municipality = ''
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
  end

  it '番地が空では購入できないこと' do
    @buyer_address.address = ''
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
  end

  it '電話番号が空では購入できないこと' do
    @buyer_address.phone_number = ''
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
  end

  it '郵便番号の保存にはハイフンが必要であること' do
    @buyer_address.postal_code = 1000000
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Postal code is invalid")
  end

  it '電話番号は11桁以内の数値のみ保存可能なこと' do
    @buyer_address.phone_number = '11111'
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
  end

  it '都道府県が未選択では購入できないこと' do
    @buyer_address.prefecture_id = 1
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
  end

  it '電話番号は12桁以上では登録できないこと' do
    @buyer_address.phone_number = '111111111111'
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
  end

  it '電話番号は数字のみでないと登録できないこと（英数字混合）' do
    @buyer_address.phone_number = '1111111aaaa'
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
  end

  it '電話番号は数字のみでないと登録できないこと（（ハイフンあり）' do
    @buyer_address.phone_number = '0-111-1111'
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
  end

  it '電話番号は全角文字では登録できないこと' do
    @buyer_address.phone_number = '１１１１１１１１１１１'
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
  end

  it 'user.idが空では購入できないこと' do
    @buyer_address.user_id = ''
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("User can't be blank")
  end

  it 'item.idが空では購入できないこと' do
    @buyer_address.item_id = ''
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
  end


  end





end

end
