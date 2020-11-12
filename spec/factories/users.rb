FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000a"}
    password_confirmation {password}
    first_name            {"苗字"}
    last_name             {"名前"}
    first_yomigana        {"ミョウジ"}
    last_yomigana         {"ナマエ"}
    birth_date            {"1930-01-01"}
  end
end