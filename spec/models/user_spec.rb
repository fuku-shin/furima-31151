require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,first_name,last_name,read_first_name,read_last_name,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordは6文字以上での入力が必須' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
      it 'passwordは半角英数混合の入力が必須' do
        @user.password = 'a2a2a2'
        @user.password_confirmation = 'a2a2a2'
        expect(@user).to be_valid
      end
      it 'passwordは確認用と一致していることが必須' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a123456'
        expect(@user).to be_valid
      end
      it 'read_first_nameが必須' do
        @user.read_first_name = 'a'
        expect(@user).to be_valid
      end
      it 'read_last_nameが必須' do
        @user.read_last_name = 'a'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailがからだと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordがからだと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'first_nameがからだと登録できない' do
        @user.first_name = nil
        @user.valid?
      end
      it 'last_nameがからだと登録できない' do
        @user.last_name = nil
        @user.valid?
      end
      it 'read_first_nameがからだと登録できない' do
        @user.read_first_name = nil
        @user.valid?
      end
      it 'read_last_nameがからだと登録できない' do
        @user.read_last_name = nil
        @user.valid?
      end
      it 'birthdayがからだと登録できない' do
        @user.birthday = nil
        @user.valid?
      end
    end
  end
end