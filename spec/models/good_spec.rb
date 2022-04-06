require 'rails_helper'

RSpec.describe Good, type: :model do
  before do
    @good = FactoryBot.build(:good)
  end

  describe '商品出品機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@good).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '商品画像を1枚つけないと保存できないこと' do
        @good.image = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと保存できないこと' do
        @good.name = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと保存できないこと' do
        @good.explanation = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報がないと保存できないこと' do
        @good.category_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報がないと保存できないこと' do
        @good.status_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報がないと保存できないこと' do
        @good.charge_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元の地域の情報がないと保存できないこと' do
        @good.region_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Region can't be blank")
      end
      it '発送までの日数の情報がないと保存できないこと' do
        @good.shipping_date_id = 1
        @good.valid?
        expect(@good.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '価格の情報がないと保存できないこと' do
        @good.price = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は半角数値のみでないと保存できないこと' do
        @good.price = 'あああaaa'
        @good.valid?
        expect(@good.errors.full_messages).to include('Price is invalid')
      end
      it '価格が300円未満では登録できないこと' do
        @good.price = '200'
        @good.valid?
        expect(@good.errors.full_messages).to include('Price is invalid')
      end
      it '価格が9999999円を超えると登録できないこと' do
        @good.price = '99999999999999'
        @good.valid?
        expect(@good.errors.full_messages).to include('Price is invalid')
      end
      it 'userが存在しなければ登録できないこと' do
        @good.user = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("User must exist")
      end
    end
  end
end
