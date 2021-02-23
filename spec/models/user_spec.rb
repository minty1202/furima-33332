require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとlast_name_kana、first_nameとfirst_name_kana、birth_dayが存在すれば登録できる' do
      end
      it 'nicknameが3文字以上6文字以下であれば登録できる' do
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空だと登録できない' do
      end
      it 'passwordが空だと登録できない' do
      end
      it 'password_confirmationが空だと登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'birth_dayが空では登録できない' do
      end
      it 'nicknameがすでに登録されていると登録できない' do
      end
      it 'nicknameが2文字以下だと登録できない' do
      end
      it 'nicknameが7文字以上だと登録できない' do
      end
      it 'emailがすでに登録されていると登録できない' do
      end
      it 'emailに@がないと登録できない' do
      end
      it 'passwordが英語のみだと登録できない' do
      end
      it 'passwordが数字のみだと登録できない' do
      end
      it 'passwordが5文字以下だと登録できない' do
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      end
      it 'password_confirmationが存在してもpasswordが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
      end
      it 'last_nameが英語だと登録できない' do
      end
      it 'last_name_kanaがカタカナ以外だと登録できない' do
      end
      it 'first_nameが英語だと登録できない' do
      end
      it 'first_name_kanaがカタカナ以外だと登録できない' do
      end
    end
  end
end

