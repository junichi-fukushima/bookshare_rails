require 'rails_helper'
describe BookreviewsController, type: :request do

  before do
    @bookreview = FactoryBot.build(:bookreview)
    @bookreview.image = fixture_file_upload('/sample.png')
    @bookreview.save
  end

  describe "GET #index" do
    it "正常にレスポンスが返ってくる" do 
      get root_path
      expect(response.status).to eq 200
    end
    it "投稿済みの書評が表示される" do 
      get root_path
      expect(response.body).to include @bookreview.author
      expect(response.body).to include @bookreview.title
    end
    it "投稿済みのツイートの画像が存在する" do 
      get root_path
      expect(response.body).to include @bookreview.image
    end
    it "投稿検索フォームが存在する" do 
    end
    
  end
end
