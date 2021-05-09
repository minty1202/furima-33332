require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとlast_name_kana、first_nameとfirst_name_kana、birth_dayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが2文字以上6文字以下であれば登録できる' do
        @user.nickname = 'aaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で英数字を含めば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（姓）を入力してください')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ふりがな（姓）を入力してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（名）を入力してください')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ふりがな（名）を入力してください')
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('誕生日を入力してください')
      end
      it 'nicknameがすでに登録されていると登録できない' do
        another_user = FactoryBot.build(:user)
        another_user.save
        @user.nickname = another_user.nickname
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームはすでに存在します')
      end
      it 'nicknameが1文字だと登録できない' do
        @user.nickname = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは2文字以上で入力してください')
      end
      it 'nicknameが7文字以上だと登録できない' do
        @user.nickname = 'aaaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは6文字以内で入力してください')
      end
      it 'emailがすでに登録されていると登録できない' do
        another_user = FactoryBot.build(:user)
        another_user.save
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'passwordが英語のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'aaa11'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
      it 'password_confirmationが存在してもpasswordが空では登録できない' do
        @user.password_confirmation = 'aaa111'
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
      it 'last_nameが英語だと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（姓）は不正な値です')
      end
      it 'last_name_kanaがカタカナ以外だと登録できない' do
        @user.last_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('ふりがな（姓）は不正な値です')
      end
      it 'first_nameが英語だと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（名）は不正な値です')
      end
      it 'first_name_kanaがカタカナ以外だと登録できない' do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('ふりがな（名）は不正な値です')
      end
    end
  end
end
