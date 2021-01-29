FactoryBot.define do
    factory :like do
      likes_count { 4 }
      association :user
      association :bookreview
    end
  end
  