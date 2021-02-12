FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    name_ue {person.last.kanji}
    name_shita {person.first.kanji}
    kana_ue {person.last.katakana}
    kana_shita {person.first.katakana}
    birthday {Faker::Date.birthday}
  end
end
