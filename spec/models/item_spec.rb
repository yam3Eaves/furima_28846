require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  
  describe '新規商品出品' do

      context '出品がうまくいくとき' do
        it 'name, explanation, category_id, condition_id, shipping_charge_bearer_id, shipping_area_id, days_untill_shipping_id, price, user_idがあれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '出品がうまくいかないとき' do
        it '商品名がないと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it '商品の説明がないと出品できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end

        it 'カテゴリの情報がないと出品できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'カテゴリが選択されていないと登録できない' do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 0")
        end

        it '商品状態の情報がないと出品できない' do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it '商品状態が選択されていないと登録できない' do
          @item.condition_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 0")
        end

        it '配送料の負担についての情報がないと出品できない' do
          @item.shipping_charge_bearer_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge bearer can't be blank")                                                 
        end

        it '配送料負担が選択されていないと登録できない' do
          @item.shipping_charge_bearer_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge bearer must be other than 0")
        end

        it '発送元地域の情報がないと出品できない' do
          @item.shipping_area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area can't be blank")
        end

        it '発送元地域が選択されていないと出品できない' do
          @item.shipping_area_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area must be other than 0")
        end

        it '発送までの日数の情報がないと出品できない' do
          @item.days_untill_shipping_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Days untill shipping can't be blank")
        end

        it '発送までの日数が選択されていないと出品できない' do
          @item.days_untill_shipping_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Days untill shipping must be other than 0")
        end


        it '価格の情報がないと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格の範囲が、300円以上であること' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it '価格の範囲が、9999999円以下であること' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end


        it 'ユーザーが紐付いていないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@tweet.errors.full_messages).to include("User must exist")
        end

        it '画像が空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@tweet.errors.full_messages).to include("Image can't be blank")
        end


      end

  end

end
