FactoryBot.define do
  factory :bookreview do
    author { '後藤ゆたか' }
    title { 'あの夕日に向かって' }
    text { '青春は男のロマンである。さあ、今駆け出そう' }
    likes_count { 4 }
    genre_id { 1 }
    association :user

    trait :image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.png')) }
    end
  end
end
