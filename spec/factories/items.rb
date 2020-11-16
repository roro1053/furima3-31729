FactoryBot.define do
  factory :item do
    name                  { 'name' }
    comment               { 'comment' }
    category_id           { '2' }
    status_id             { '2' }
    delivery_fee_id       { '2' }
    shipment_source_id    { '47' }
    shipping_day_id       { '2' }
    price                 { '300' }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
