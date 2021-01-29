require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @name = FactoryBot.build(:name)
  end
  describe 'ウィザード形式(名前・誕生日保存)' do
    context '正常形' do
      it '全て正常' do
        expect(@name.valid?).to eq true
      end
    end
    context '異常系' do
      it 'birth_date:必須' do
        @name.birth_date = ''
        @name.valid?
        expect(@name.errors.full_messages).to include('誕生日を入力してください')
      end
      it 'last_name:必須' do
        @name.last_name = ''
        @name.valid?
        expect(@name.errors.full_messages).to include('名(お名前)を入力してください')
      end
      it 'last_name:全角（漢字・ひらがな・カタカナ）' do
        @name.last_name = 'test'
        @name.valid?
        expect(@name.errors.full_messages).to include('名(お名前)はひらがな・漢字全角で入力してください')
      end
      it 'first_name:必須' do
        @name.first_name = ''
        @name.valid?
        expect(@name.errors.full_messages).to include('姓(お名前)を入力してください')
      end
      it 'first_name:全角（漢字・ひらがな・カタカナ）' do
        @name.first_name = 'test'
        @name.valid?
        expect(@name.errors.full_messages).to include('姓(お名前)はひらがな・漢字全角で入力してください')
      end
      it 'last_name_kana:必須' do
        @name.last_name_kana = ''
        @name.valid?
        expect(@name.errors.full_messages).to include('姓カナ(お名前)を入力してください')
      end
      it 'last_name_kana:全角（カタカナ）' do
        @name.last_name_kana = 'てすと'
        @name.valid?
        expect(@name.errors.full_messages).to include('姓カナ(お名前)はカタカナ全角で入力してください')
      end
      it 'last_name_kana:全角（カタカナ）' do
        @name.last_name_kana = 'aaa'
        @name.valid?
        expect(@name.errors.full_messages).to include('姓カナ(お名前)はカタカナ全角で入力してください')
      end
      it 'first_name_kana:必須' do
        @name.first_name_kana = ''
        @name.valid?
        expect(@name.errors.full_messages).to include('名カナ(お名前)を入力してください')
      end
      it 'first_name_kana:全角（カタカナ）' do
        @name.first_name_kana = 'てすと'
        @name.valid?
        expect(@name.errors.full_messages).to include('名カナ(お名前)はカタカナ全角で入力してください')
      end
      it 'first_name_kana:全角（カタカナ）' do
        @name.first_name_kana = 'aaa'
        @name.valid?
        expect(@name.errors.full_messages).to include('名カナ(お名前)はカタカナ全角で入力してください')
      end
    end
  end
end
