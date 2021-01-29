require 'rails_helper'

RSpec.describe Bookreview, type: :model do
  before do
    @bookreview = FactoryBot.build(:bookreview)
    # 画像の場合ここでバリューを入れる
    @bookreview.image = fixture_file_upload('/sample.png')
  end
  describe '書評投稿機能' do
    context '正常形' do
      it '全て正常' do
        expect(@bookreview.valid?).to eq true
      end
    end
    context '異常系' do
      it 'image:必須' do
        # MessageVerifierをCookieで改ざんのチェックに利用
        # 文字列として認識されるとうまく保存ができない
        @bookreview.image = nil
        @bookreview.valid?
        expect(@bookreview.errors.full_messages).to include('画像を入力してください')
      end
      it 'author:必須' do
        @bookreview.author = ''
        @bookreview.valid?
        expect(@bookreview.errors.full_messages).to include('著者の部分を正しく入力してください')
      end
      it 'title:必須' do
        @bookreview.title = ''
        @bookreview.valid?
        expect(@bookreview.errors.full_messages).to include('タイトルを正しく入力してください')
      end
      it 'text:必須' do
        @bookreview.text = ''
        @bookreview.valid?
        expect(@bookreview.errors.full_messages).to include('書評・アウトプットを入力してください')
      end
      it 'genre_id:必須' do
        @bookreview.genre_id = ''
        @bookreview.valid?
        expect(@bookreview.errors.full_messages).to include('ジャンルを入力してください')
      end
      it 'genre_id:0以外' do
        @bookreview.genre_id = 0
        @bookreview.valid?
        expect(@bookreview.errors.full_messages).to include('ジャンルを選んでください')
      end
    end
  end
end
