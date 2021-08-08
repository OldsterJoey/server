class ChildProfile < ApplicationRecord
    include ActiveModel::Serialization
    has_one :wish_list
    belongs_to :user
    has_many :wishes, through: :wish_list
    accepts_nested_attributes_for :wish_list

    def transform_child 
        return { 
        username: self.user.username,
        wishlist: self.wish_list,
        name: self.name, 
        posted: self.created_at, 
        edited: self.updated_at
        }
    end 
end