class WishList < ApplicationRecord
  belongs_to :child_profile
  has_many :wishes, dependent: :destroy
  accepts_nested_attributes_for :wishes
end

def transform_wish_list
  return { 
  username: self.user.username,
  wish: self.wish,
  name: self.name, 
  posted: self.created_at, 
  edited: self.updated_at
  }
end 