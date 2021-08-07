# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
    User.create(username: "Joey", email: "joey@test.com", password: "joey12321", password_confirmation: "joey12321")
    User.create(username: "Irina", email: "irina@test.com", password: "irina12321", password_confirmation: "irina12321")
end

if Question.count == 0
    Question.create(question: "What's the meaning of life, the universe and everything?", answer: "42") 
    puts "created admin questions"
end

if ChildProfile.count == 0
    ChildProfile.create(user_id: 1, name: "Joey")
    ChildProfile.create(user_id: 2, name: "Irina")
    puts "created child profiles"
end

if AdminProfile.count == 0
    AdminProfile.create(user_id: 1, name: "JoeyAdmin")
    AdminProfile.create(user_id: 2, name: "IrinaAdmin")
    puts "created admin profiles"
end

if WishList.count == 0
    WishList.create!(name: "joeyswishlist", child_profile_id: 1)
    puts "created wishlist"
end

if Wish.count == 0
    Wish.create(name: "I wish for a pink bicycle", wish_list_id: 1)
    Wish.create(name: "I wish for a nintendo", wish_list_id: 1)
    puts "created wishes"
end

# wishes_wish_list = [wish_list_id: 1]
# if WishList.all.length == 0 
#     wishes_wish_list.each do |wish|
#         WishList.create(wish_list_id: num+1)
#         puts "created wish"
#     end