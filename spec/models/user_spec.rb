require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nickname,encrypted_password,email,first_name,last_name,first_yomigana,last_yomigana,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが40文字以内なら登録できる" do
        @user.nickname = "1234567890123456789012345678901234567890"
        expect(@user).to be_valid
      end
      it "passwordが英数混合なら登録できる" do
        @user.password = "12345b"
        @user.password_confirmation = "12345b"
        expect(@user).to be_valid
      end
      it "お名前が全角（ひらがな、カタカナ、漢字）なら登録できる" do
        @user.first_name = "ひカ漢"
        @user.last_name = "ひカ漢"
        expect(@user).to be_valid
      end
      it "本名（読み仮名）がカタカナなら登録できる"do
        @user.first_yomigana = "カタカナ"
        @user.last_yomigana = "カタカナ"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
       @user.nickname = ""
       @user.valid?
       binding.pry

      end
      it "nicknameが41文字以上だと登録できない" do
      end
      it "encrypted_passwordが空だと登録できない" do
      end
      it "passwordとencrypted_passwordが違うと登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "重複したemailだと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "first_nameにアルファベットが入ると登録できない" do
      end
      it "first_nameに数字が入ると登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "last_nameにアルファベットが入ると登録できない" do
      end
      it "last_nameに数字が入ると登録できない" do
      end
      it "first_yomiganaが空だと登録できない" do
      end
      it "first_yomiganaにアルファベットが入ると登録できない" do
      end
      it "first_yomiganaに数字が入ると登録できない" do
      end
      it "first_yomiganaに漢字が入ると登録できない" do
      end
      it "first_yomiganaにひらがなが入ると登録できない" do
      end
      it "last_yomiganaが空だと登録できない" do
      end
      it "last_yomiganaにアルファベットが入ると登録できない" do
      end
      it "last_yomiganaに数字が入ると登録できない" do
      end
      it "last_yomiganaに漢字が入ると登録できない" do
      end
      it "last_yomiganaにひらがなが入ると登録できない" do
      end
      it "birth_dateが空だと登録できない" do
      end
      it "西暦が空だと登録できない" do
      end
      it "月が空だと登録できない" do
      end
      it "日にちが空だと登録できない" do
      end
     
    end
  end
end