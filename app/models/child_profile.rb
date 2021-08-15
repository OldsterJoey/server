class ChildProfile < ApplicationRecord
    include ActiveModel::Serialization
    has_one :wish_list, dependent: :destroy
    belongs_to :user
    has_many :wishes, through: :wish_list, dependent: :destroy
    accepts_nested_attributes_for :wish_list
    # def transform_child 
    #     return { 
    #     username: self.user.username,
    #     name: self.name, 
    #     wishlist: self.wish_list,
    #     posted: self.created_at, 
    #     edited: self.updated_at
    #     }
    # end 
end