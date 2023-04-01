# require 'faker'

puts "📃 Seeding data..."


# # Create categories
# 5.times do
#   Category.create!(
#     name: Faker::Lorem.word,
#     description: Faker::Lorem.sentence
#   )
# end

# # Create users
# 10.times do
#   User.create!(
#     username: Faker::Internet.username,
#     email: Faker::Internet.email,
#     password_digest: Faker::Internet.password,
#   )
# end

# # Create recipes
# 10.times do
#   Recipe.create!(
#     title: Faker::Lorem.sentence,
#     instructions: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
#     ingredients: Faker::Lorem.words(number: 10).join(", "),
#     prep_time: Faker::Number.between(from: 10, to: 120),
#     user: User.order("RANDOM()").first,
#     category: Category.order("RANDOM()").first
#   )
# end

# # Create reviews
# 10.times do
#   Review.create!(
#     user: User.order("RANDOM()").first,
#     recipe: Recipe.order("RANDOM()").first,
#     rating: Faker::Number.between(from: 1, to: 5)
#   )
# end


 puts "✅ Done seeding"  