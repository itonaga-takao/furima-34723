FactoryBot.define do
  factory :user do
    nickname {'あああ'}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    real_first_name {'あああ'}
    real_last_name {'あああ'}
    kana_first_name {'アアア'}
    kana_last_name {'アアア'}
    birthday {'1966-12-23'}

    



  end
end
