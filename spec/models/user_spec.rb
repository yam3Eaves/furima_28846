require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

     context '新規登録がうまくいくとき' do
      it "nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthdayがあれば登録できる " do
        expect(@user).to be_valid
      end 
      it "passwordが6文字以上で登録できる" do
        @user.password_confirmation = "a1b2c3"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに一意性がないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      # it "emailに＠を含む必要がある" do
      #   @user.email = "aaaa.com"
      #   @user.valid?
      #   binding.pry
      #   expect(@user.errors.full_messages).to include() 
      # end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "a1b2c"
        @user.password_confirmation = "a1b2c"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数字混合でないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは確認用含めて2回の入力がないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字がないと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名前がないと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名字に数字が入ると登録できない" do
        @user.last_name = "やまぐち1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "名前に数字が入ると登録できない" do
        @user.first_name = "かずや1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "名字のフリガナが無いと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "名前のフリガナが無いと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名字のフリガナにひらがなが入ると登録できない" do
        @user.last_name_kana = "ヤマグち"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "名前のフリガナにひらがなが入ると登録できない" do
        @user.first_name_kana = "カズや"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "生年月日が無いと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
