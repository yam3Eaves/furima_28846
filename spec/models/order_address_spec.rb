require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address= FactoryBot.build(:order_address)
  end

  describe '商品購入' do


    context '購入がうまくいくとき' do 

      it 'すべての情報が格納されていれば購入できる' do
        expect(@order_address).to be_valid
      end
    end


    context '購入がうまくいかないとき' do 

      it '郵便番号が入力されていないと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県が選択されていいないと購入できない' do
        @order_address.prefectures_id= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
      end

      it '市区町村が入力されていないと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地等の住所の入力がされていないと購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '郵便番号が入力されていないと購入できない' do
        @order_address.tel_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel num can't be blank")
      end

      it '郵便番号にハイフンがない場合は購入できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '電話番号にハイフンがある場合は購入できない' do
        @order_address.tel_num = '111-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel num is invalid")
      end

      it '電話番号が12桁以上だと購入できない' do
        @order_address.tel_num = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel num is invalid")
      end

      it ' トークンがなければ購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

    end
    
  end
    
end
