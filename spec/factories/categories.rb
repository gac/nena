FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department }
    description { Faker::Lorem.paragraph }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/image.jpg'), 'image/jpeg') }
  end
end
