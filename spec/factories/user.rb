FactoryBot.define do
    factory :user do
        User.create(username: "Joey", email: "joey@test.com", password: "joey12321", password_confirmation: "joey12321")
        User.create(username: "Irina", email: "irina@test.com", password: "irina12321", password_confirmation: "irina12321")
    end
end