# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unsplash_images = Unsplash::Photo.search('coffee', 1, 10)

20.times do 
  User.create(name: Faker::Name.unique.name, email: Faker::Internet.email, picture_url: Faker::Avatar.image)
end

unsplash_images.each do |img|
  Team.create(name: Faker::Coffee.blend_name, description: Faker::Coffee.notes, cover_url: img.urls.regular)
end

Team.all.each do |team|
  team.users = User.all.sample(4)
end