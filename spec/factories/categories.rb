FactoryBot.define do
  factory :category do
    name { "Electronics" }
    description { "Electronic devices and gadgets" }

    trait :electronics do
      name { "Electronics" }
    end

    trait :fashion do
      name { "Fashion" }
    end

    trait :home_garden do
      name { "Home & Garden" }
    end
  end
end
