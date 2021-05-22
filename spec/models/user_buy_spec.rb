require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @buy = FactoryBot.build(:user_buy)
  end

  describe '新規購入' do
    context '新規購入できる時' do
      it 'building以外があればがあれば登録できる' do
        expect(@buy).to be_valid
      end
    end

    context '新規購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @buy.postal_code = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal codeを入力してください')
      end
      it 'prefecture_idが空だと登録できない' do
        @buy.prefecture_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Prefectureを入力してください')
      end
      it 'cityが空だと登録できない' do
        @buy.city = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Cityを入力してください')
      end
      it 'addressesが空だと登録できない' do
        @buy.addresses = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Addressesを入力してください')
      end
      it 'phone_numberが空では登録できない' do
        @buy.phone_number = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone numberを入力してください')
      end
      it 'phone_numberが数字以外では登録できない' do
        @buy.phone_number = 'aaaaa'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone numberは数値で入力してください')
      end
    end
  end
end
