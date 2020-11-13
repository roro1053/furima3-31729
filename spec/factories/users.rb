FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"12345a"}
    password_confirmation {password}
    first_name            {"苗字"}
    last_name             {"名前"}
    first_yomigana        {"ミョウジ"}
    last_yomigana         {"ナマエ"}
    birth_date            {"1930-01-01"}
  end
end