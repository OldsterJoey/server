# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.create!([{
    question: "What's the meaning of life, the universe and everything?",
    answer: "42"
}])
 
puts "created admin questions"

ChildProfile.create!([{
    name: "Joey"
},
{
    name: "Irina"
}])

puts "created child profile"

WishList.create!([{
    name: "joeyswishlist",
    child_profile_id: 1
}])

puts "created wishlist"

# Wish.create!([{
#     name: "I wish for a pink bicycle",
#     wish_list_id: 1
# }])

wishes_wish_list = [wish_list_id: 1]
if WishList.all.length == 0 
    wishes_wish_list.each do |wish|
        WishList.create(wish_list_id: num+1)
        puts "created wish"
    end
end
