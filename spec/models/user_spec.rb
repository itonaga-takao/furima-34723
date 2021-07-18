require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do

      it 'nameとemail、passwordとpassword_confirmationの内容に問題ない場合登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'aaa456'
        @user.password_confirmation = 'aaa456'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    


      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'passwordは半角数字のみでの登録ができないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')

      end

      it 'passwordは英字のみでの登録ができないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')

      end

      it 'passwordは全角英数字混合での登録ができないこと' do
        @user.password = 'ＡＡＡ１１１'
        @user.password_confirmation = 'ＡＡＡ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')

      end


      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'real_first_nameが空では登録できないこと' do
        @user.real_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Real first name can't be blank")
      end

      it 'real_last_nameが空では登録できないこと' do
        @user.real_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Real last name can't be blank")
      end

      it 'kana_first_nameが空では登録できないこと' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it 'kana_last_nameが空では登録できないこと' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      

      it 'emailは@を含まないと登録できないこと' do
        @user.email = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'real_first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        
        @user.real_first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Real first name is invalid. Input full-width katakana characters.")
      end

      it 'real_last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.real_last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Real last name is invalid. Input full-width katakana characters.")
      end

      it 'kana_first_nameが全角カタカナ以外では登録できないこと' do
        @user.kana_first_name = 'a1あ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters.")
      end

      it 'kana_last_nameが全角カタカ以外ナでは登録できないこと' do
        @user.kana_last_name = 'a1あ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width katakana characters.")
      end
    end
  end
end