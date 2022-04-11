require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it '建物名は任意であること' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it ' 郵便番号が必須であること' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order.postcode = '12345678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode is invalid. Input half-width character string of 3 digits hyphen 4 digits.")
      end
      it '都道府県が必須であること' do
        @order.region_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が必須であること。' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること' do
        @order.phonenumber = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order.phonenumber = '123aaa123123'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber is invalid. Input half-width numbers.")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
