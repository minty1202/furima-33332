require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.create(:item) }

  before do
    sleep(0.1)
  end

  describe '新規出品' do
    context '出品できる時' do
      it 'name, text, price, category_id, status_id, fee_status_id, prefecture_id, delivery_idがあれば出品できる' do
        expect(item).to be_valid
      end
      it 'priceが300..9999999の間であれば登録できる' do
        item.price = 300
        expect(item).to be_valid
      end
    end

    context '新規出品できないとき' do
      it 'nameが空では登録できない' do
        item.name = ''
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:name)}を入力してください")
      end
      it 'infoが空だと登録できない' do
        item.info = ''
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:info)}を入力してください")
      end
      it 'imageが空だと登録できない' do
        item.image = nil
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:image)}を入力してください")
      end
      it 'priceが空だと登録できない' do
        item.price = ''
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:price)}を入力してください")
      end
      it 'priceが300未満だと登録できない' do
        item.price = 299
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:price)}は300円から9,999,999円の間で設定してください")
      end
      it 'priceがだと9999999超過だと登録できない' do
        item.price = 10_000_000
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:price)}は300円から9,999,999円の間で設定してください")
      end
      it 'category_idが1だと登録できない' do
        item.category_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:category_id)}は空白以外にしてください")
      end
      it 'status_idが1だと登録できない' do
        item.status_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:status_id)}は空白以外にしてください")
      end
      it 'fee_status_idが1だと登録できない' do
        item.fee_status_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:fee_status_id)}は空白以外にしてください")
      end
      it 'delivery_idが1だと登録できない' do
        item.delivery_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:delivery_id)}は空白以外にしてください")
      end
      it 'prefecture_idが1だと登録できない' do
        item.prefecture_id = 1
        item.valid?
        expect(item.errors.full_messages).to include("#{Item.human_attribute_name(:prefecture_id)}は空白以外にしてください")
      end
    end
  end
end
