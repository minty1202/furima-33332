require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    buy = FactoryBot.build(:user_buy)
    buy.item_id = item.id
    buy.user_id = user.id
    @buy = buy
    sleep 0.1
  end

  describe '新規購入' do
    context '新規購入できる時' do
      it '全ての値があればがあれば登録できる' do
        expect(@buy).to be_valid
      end
      it 'building以外があればがあれば登録できる' do
        @buy.building = ''
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

      it 'tokenが空だと登録できない' do
        @buy.token = ''
        @buy.valid?

        expect(@buy.errors.full_messages).to include('Tokenを入力してください')
      end
      it 'user_idが空だと登録できない' do
        @buy.user_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Userを入力してください')
      end
      it 'item_idが空だと登録できない' do
        @buy.item_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Itemを入力してください')
      end
      it 'prefecture_idが1だと登録できない' do
        @buy.prefecture_id = '1'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Prefectureは1以外の値にしてください')
      end
      it '電話番号が12桁以上だと登録できない' do
        @buy.phone_number = '123456789012'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone numberは11文字以内で入力してください')
      end
      it '電話番号が英数字混合だと登録できない' do
        @buy.phone_number = 'a9a123a123a'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone numberは数値で入力してください')
      end
    end
  end
end
