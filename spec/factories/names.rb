FactoryBot.define do
  factory :name do
    last_name { '次郎' }
    first_name { '田中' }
    last_name_kana { 'ジロウ' }
    first_name_kana { 'タナカ' }
    birth_date { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
    association :user
  end
end
