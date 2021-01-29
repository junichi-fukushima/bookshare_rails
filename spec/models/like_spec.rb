require 'rails_helper'

# likesテーブルは中間テーブルに当たるため(多対多のため)実装必要なし
RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end
  describe 'いいね！機能' do
    context '正常形' do
      it '全て正常' do
        expect(@like.valid?).to eq true
      end
    end
    context '異常系' do
    end
  end
end
