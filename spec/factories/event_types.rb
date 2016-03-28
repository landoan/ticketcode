FactoryGirl.define do
  factory :event_type do |f|
    f.name { Faker::Commerce.product_name }

  end

end
