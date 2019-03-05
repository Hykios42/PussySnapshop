# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all

puts "Création de produits"
pic_count = 1
20.times do 
  item = Item.create!(title: Faker::Book.title, description: Faker::Hacker.say_something_smart, price: Faker::Number.between(1, 1000), image_url: "pussycat#{pic_count}.jpg")
  pic_count += 1
end
puts "Produits créés !"

puts "Création d'utilisateurs"
10.times do
  user = User.create!(email: Faker::Internet.free_email, password: "motdepasse")
  #puts user
end
puts "Utilisateurs créés !"

puts "Création de paniers"
cart_count = 1
10.times do
  cart = Cart.create!(item_id: rand(Item.all.first.id..Item.all.last.id), user_id: cart_count)
  cart_count += 1
  #puts cart
end
puts "Paniers créés !"

puts "Création de commandes"
25.times do
  order = Order.create!(item_id: rand(Item.all.first.id..Item.all.last.id), user_id: rand(User.all.first.id..User.all.last.id))
  #puts order
end
puts "Commandes créées !"