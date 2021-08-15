class WishList < ApplicationRecord
  belongs_to :child_profile
  has_many :wishes, dependent: :destroy
  accepts_nested_attributes_for :wishes
  # def transform_wish_list
  #   return {
  #   name: self.name, 
  #   child_profile_id: self.child_profile_id,
  #   wishes: self.wishes,
  #   posted: self.created_at, 
  #   edited: self.updated_at
  #   }
  # end
end
