require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山口", first_name: "和也", last_name_kana: "yamaguchi", first_name: "kazuya", birthday:  )
      user.valid?
    end
    it "emailが空では登録できない" do
    end
  end




end
