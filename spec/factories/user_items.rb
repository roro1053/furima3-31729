FactoryBot.define do
  factory :user_item do
    postal_cord    { "000-0000" }
    prefecture_id  { 2 }
    city           { "aあア亜" }
    house_number   { "市町1-0-1" }
    building_name  { "マンション" }
    phone_number   { "08066662222" }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
