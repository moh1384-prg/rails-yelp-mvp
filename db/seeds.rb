require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )

  # Create reviews for each restaurant
  3.times do
    Review.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
  end
end

puts "Finished!"
