FactoryGirl.define do
  factory :event do |f|
    f.name { Faker::Commerce.product_name }
    f.start_at { Faker::Date.forward(23) }
    f.description "text description"
  end

end
