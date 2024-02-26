FactoryBot.define do
  factory :line_item do
    order
    product
    price { 10.0 }
  end
end
