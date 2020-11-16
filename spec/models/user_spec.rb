require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname,encrypted_password,email,first_name,last_name,first_yomigana,last_yomigana,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以内なら登録できる' do
        @user.nickname = '1234567890123456789012345678901234567890'
        expect(@user).to be_valid
      end
      it 'passwordが英数混合なら登録できる' do
        @user.password = '12345b'
        @user.password_confirmation = '12345b'
        expect(@user).to be_valid
      end
      it 'お名前が全角（ひらがな、カタカナ、漢字）なら登録できる' do
        @user.first_name = 'ひカ漢'
        @user.last_name = 'ひカ漢'
        expect(@user).to be_valid
      end
      it '本名（読み仮名）がカタカナなら登録できる' do
        @user.first_yomigana = 'カタカナ'
        @user.last_yomigana = 'カタカナ'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが違うと登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが半角英字のみだと登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角数字のみだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが6文字以下だと登録できない' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
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
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'pppgmal.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'first_nameにアルファベットが入ると登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameに数字が入ると登録できない' do
        @user.first_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameにアルファベットが入ると登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_nameに数字が入ると登録できない' do
        @user.last_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_yomiganaが空だと登録できない' do
        @user.first_yomigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First yomigana can't be blank")
      end
      it 'first_yomiganaにアルファベットが入ると登録できない' do
        @user.first_yomigana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First yomigana is invalid')
      end
      it 'first_yomiganaに数字が入ると登録できない' do
        @user.first_yomigana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('First yomigana is invalid')
      end
      it 'first_yomiganaに漢字が入ると登録できない' do
        @user.first_yomigana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('First yomigana is invalid')
      end
      it 'first_yomiganaにひらがなが入ると登録できない' do
        @user.first_yomigana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First yomigana is invalid')
      end
      it 'last_yomiganaが空だと登録できない' do
        @user.last_yomigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last yomigana can't be blank")
      end
      it 'last_yomiganaにアルファベットが入ると登録できない' do
        @user.last_yomigana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last yomigana is invalid')
      end
      it 'last_yomiganaに数字が入ると登録できない' do
        @user.last_yomigana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last yomigana is invalid')
      end
      it 'last_yomiganaに漢字が入ると登録できない' do
        @user.last_yomigana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last yomigana is invalid')
      end
      it 'last_yomiganaにひらがなが入ると登録できない' do
        @user.last_yomigana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last yomigana is invalid')
      end
      it 'birth_dateが空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
