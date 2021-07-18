FactoryBot.define do
  factory :user do
    nickname {'あああ'}
    email {Faker::Internet.free_email}
    password {'abcd12'}
    password_confirmation {'abcd12'}
    real_first_name {'あああ'}
    real_last_name {'あああ'}
    kana_first_name {'アアア'}
    kana_last_name {'アアア'}
    birthday {'1966-12-23'}

    



  end
end
